terraform {
 required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

provider "libvirt" {
  # Configuration options
  uri = "qemu+ssh://hcartiaux@srv.nbsdn.fr.eu.org:222/system"
}

resource "libvirt_pool" "terraform" {
  name = "terraform"
  type = "dir"
  path = "/var/lib/libvirt/terraform"
}

# We fetch the latest ubuntu release image from their mirrors
resource "libvirt_volume" "disk_ubuntu" {
  name   = "ubuntu.qcow2"
  pool   = libvirt_pool.terraform.name
  source = "https://cloud-images.ubuntu.com/releases/23.10/release/ubuntu-23.10-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "disk_ubuntu_resized" {
  name           = "ubuntu-terraform.qcow2"
  base_volume_id = libvirt_volume.disk_ubuntu.id
  pool           = libvirt_pool.terraform.name
  size           = 5361393152
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}

# for more info about paramater check this out
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/cloudinit.html.markdown
# Use CloudInit to add our ssh-key to the instance
# you can add also meta_data field
resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = libvirt_pool.terraform.name
}

# Create the machine
resource "libvirt_domain" "domain-ubuntu" {
  name   = "ubuntu-terraform"
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    bridge = "vmbr0"
  }

  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.disk_ubuntu_resized.id
  }

}

