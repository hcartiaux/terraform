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

data "oci_core_vnic_attachments" "vnics_fr_mrs1" {
  compartment_id = var.tenancy_ocid
  instance_id    = oci_core_instance.fr_mrs1.id
}
data "oci_core_private_ips" "primary_private_ip" {
  vnic_id = data.oci_core_vnic_attachments.vnics_fr_mrs1.vnic_attachments[0].vnic_id
}

resource "oci_core_public_ip" "public_ip_fr_mrs1" {
  compartment_id = var.tenancy_ocid
  display_name   = "fr-mrs1 PublicIP"
  lifetime       = "RESERVED"
  private_ip_id = data.oci_core_private_ips.primary_private_ip.private_ips[0].id
}
resource "oci_core_ipv6" "public_ipv6_fr_mrs1" {
  display_name = "fr-mrs1 Public IPv6"
  vnic_id      = data.oci_core_vnic_attachments.vnics_fr_mrs1.vnic_attachments[0].vnic_id
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

data "oci_core_vnic_attachments" "vnics_fr_mrs2" {
  compartment_id = var.tenancy_ocid
  instance_id    = oci_core_instance.fr_mrs2.id
}
data "oci_core_private_ips" "primary_private_ip_fr_mrs2" {
  vnic_id = data.oci_core_vnic_attachments.vnics_fr_mrs2.vnic_attachments[0].vnic_id
}

resource "oci_core_public_ip" "public_ip_fr_mrs2" {
  compartment_id = var.tenancy_ocid
  display_name   = "fr-mrs2 PublicIP"
  lifetime       = "RESERVED"
  private_ip_id  = data.oci_core_private_ips.primary_private_ip_fr_mrs2.private_ips[0].id
}
resource "oci_core_ipv6" "public_ipv6_fr_mrs2" {
  display_name = "fr-mrs1 Public IPv6"
  vnic_id      = data.oci_core_vnic_attachments.vnics_fr_mrs2.vnic_attachments[0].vnic_id
}
