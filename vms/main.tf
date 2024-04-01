# Fetching the OS cloud image
resource "libvirt_volume" "disk_vm" {
  name   = "${var.vm_name}-base.qcow2"
  pool   = var.pool_name
  source = var.cloud_image_url
  format = "qcow2"
}

resource "libvirt_volume" "disk_vm_resized" {
  name           = "${var.vm_name}.qcow2"
  base_volume_id = libvirt_volume.disk_vm.id
  pool           = var.pool_name
  size           = var.vm_disk_size
}



# for more info about paramater check this out
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/cloudinit.html.markdown
# Use CloudInit to add our ssh-key to the instance
# you can add also meta_data field
resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = "#cloud-config\n#Generated by Terraform\n${yamlencode(local.user_data)}"
  network_config = "#Generated by Terraform---\n${yamlencode(local.network_config)}"
  pool           = var.pool_name
}


# Create the machine
resource "libvirt_domain" "domain-vm" {
  name   = var.vm_name
  memory = var.vm_memory
  vcpu   = var.vm_vcpu

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    bridge = var.bridge_name
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

  autostart = true

  disk {
    volume_id = libvirt_volume.disk_vm_resized.id
  }

}
