# Data source for availability domain
data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

# Create VCN (Virtual Cloud Network) with IPv6 support
resource "oci_core_vcn" "vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.tenancy_ocid
  display_name   = "Virtual Cloud Network"
  dns_label      = "VCN"

  # Enable IPv6 for the VCN
  is_ipv6enabled = true
}

# Data source to get VCN details after creation (including IPv6 CIDR blocks)
data "oci_core_vcn" "vcn" {
  vcn_id = oci_core_vcn.vcn.id
}

# Create Subnet with IPv6 support
resource "oci_core_subnet" "subnet" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  cidr_block          = "10.0.1.0/24"
  ipv6cidr_block      = cidrsubnet(data.oci_core_vcn.vcn.ipv6cidr_blocks[0], 8, 1)
  display_name        = "Subnet"
  dns_label           = "Subnet"
  security_list_ids   = [oci_core_security_list.security_list.id]
  compartment_id      = var.tenancy_ocid
  vcn_id              = oci_core_vcn.vcn.id
  route_table_id      = oci_core_vcn.vcn.default_route_table_id
  dhcp_options_id     = oci_core_vcn.vcn.default_dhcp_options_id
}

# Create Internet Gateway
resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.tenancy_ocid
  display_name   = "Internet Gateway"
  vcn_id         = oci_core_vcn.vcn.id
}

# Create Route Table with IPv6 support
resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  display_name               = "Route Table"

  # IPv4 route
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }

  # IPv6 route
  route_rules {
    destination       = "::/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

# Create Security List with IPv6 rules
resource "oci_core_security_list" "security_list" {
  compartment_id = var.tenancy_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "Security List"

  # IPv4 egress rules
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  # IPv6 egress rules
  egress_security_rules {
    protocol    = "all"
    destination = "::/0"
  }

  # IPv4 ingress rules
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      max = "22"
      min = "22"
    }
  }

  # IPv6 ingress rules
  ingress_security_rules {
    protocol = "6"
    source   = "::/0"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
}
