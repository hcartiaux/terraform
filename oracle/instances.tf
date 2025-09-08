## fr-mrs1

# Create compute instance with an attached VNIC that supports IPv6
resource "oci_core_instance" "fr_mrs1" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.tenancy_ocid
  display_name        = "fr-mrs1"
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type             = "image"
    source_id               = "ocid1.image.oc1.eu-marseille-1.aaaaaaaar4iukuvrp62fl6bjtbwndwddg57bexfq6vypooao7cxolmdszi7a"
    boot_volume_size_in_gbs = 50
    kms_key_id              = null
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    display_name     = "VNIC"
    hostname_label   = "fr-mrs1"
    assign_public_ip = false
    assign_ipv6ip    = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_pub_key
    user_data = base64encode(templatefile("${path.module}/cloud-init.yaml", {
      ssh_pub_key = var.ssh_pub_key
    }))
  }

  timeouts {
    create = "60m"
  }
}

# Find the VNIC attachment for the instance
data "oci_core_vnic_attachments" "fr_mrs1_vnics" {
  compartment_id = var.tenancy_ocid
  instance_id    = oci_core_instance.fr_mrs1.id
}

# Find the primary private IP using the VNIC ID from the attachment
data "oci_core_private_ips" "primary_private_ip" {
  # Using the VNIC OCID is more reliable than using the IP address string
  vnic_id = data.oci_core_vnic_attachments.fr_mrs1_vnics.vnic_attachments[0].vnic_id
}

# Create and assign a reserved IPv4 Public IP
resource "oci_core_public_ip" "public_ip_fr_mrs1" {
  compartment_id = var.tenancy_ocid
  display_name   = "fr-mrs1 PublicIP"
  lifetime       = "RESERVED"
  private_ip_id = data.oci_core_private_ips.primary_private_ip.private_ips[0].id
}

# Create and assign a Public IPv6
resource "oci_core_ipv6" "public_ipv6_fr_mrs1" {
  display_name = "fr-mrs1 Public IPv6"
  vnic_id      = data.oci_core_vnic_attachments.fr_mrs1_vnics.vnic_attachments[0].vnic_id
}



## fr-mrs2

# Create compute instance with an attached VNIC that supports IPv6
resource "oci_core_instance" "fr_mrs2" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.tenancy_ocid
  display_name        = "fr-mrs2"
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type             = "image"
    source_id               = "ocid1.image.oc1.eu-marseille-1.aaaaaaaar4iukuvrp62fl6bjtbwndwddg57bexfq6vypooao7cxolmdszi7a"
    boot_volume_size_in_gbs = 50
    kms_key_id              = null
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    display_name     = "VNIC"
    hostname_label   = "fr-mrs2"
    assign_public_ip = false
    assign_ipv6ip    = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_pub_key
    user_data = base64encode(templatefile("${path.module}/cloud-init.yaml", {
      ssh_pub_key = var.ssh_pub_key
    }))
  }

  timeouts {
    create = "60m"
  }
}

# Find the VNIC attachment for the instance
data "oci_core_vnic_attachments" "fr_mrs2_vnics" {
  compartment_id = var.tenancy_ocid
  instance_id    = oci_core_instance.fr_mrs2.id
}

# Find the primary private IP using the VNIC ID from the attachment
data "oci_core_private_ips" "primary_private_ip_fr_mrs2" {
  # Using the VNIC OCID is more reliable than using the IP address string
  vnic_id = data.oci_core_vnic_attachments.fr_mrs2_vnics.vnic_attachments[0].vnic_id
}

# Create and assign a reserved IPv4 Public IP
resource "oci_core_public_ip" "public_ip_fr_mrs2" {
  compartment_id = var.tenancy_ocid
  display_name   = "fr-mrs2 PublicIP"
  lifetime       = "RESERVED"
  private_ip_id  = data.oci_core_private_ips.primary_private_ip_fr_mrs2.private_ips[0].id
}

# Create and assign a Public IPv6
resource "oci_core_ipv6" "public_ipv6_fr_mrs2" {
  display_name = "fr-mrs1 Public IPv6"
  vnic_id      = data.oci_core_vnic_attachments.fr_mrs2_vnics.vnic_attachments[0].vnic_id
}
