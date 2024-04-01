server_uri = "qemu+ssh://hcartiaux@srv.nbsdn.fr.eu.org:222/system"

pool_name = "terraform"
pool_path = "/var/lib/libvirt/terraform"

vms_list = {
  "ubuntu-terraform" = {
    vm_memory = 512
    vm_vcpu = 1
    vm_disk_size = 10361393152
    cloud_image_url = "https://cloud-images.ubuntu.com/releases/23.10/release/ubuntu-23.10-server-cloudimg-amd64.img"
    bridge_name = "vmbr0"
  }
}

