server_uri = "qemu+ssh://hcartiaux@srv.nbsdn.fr.eu.org:222/system"
pool_name = "terraform"
pool_path = "/var/lib/libvirt/terraform"

network_defaults = {
  gateway4 = "192.168.0.1"
  gateway6 = "2001:bc8:3feb:100::2"
  nameservers = [
    "2001:bc8:3feb:100::2",
  ]
}

vms_list = {
  "ubuntu-terraform" = {
    bridge_name = "vmbr0"
    vm_memory = 512
    vm_vcpu = 1
    vm_disk_size = 10361393152
    cloud_image_url = "https://cloud-images.ubuntu.com/releases/23.10/release/ubuntu-23.10-server-cloudimg-amd64.img"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.5/16",
          "2001:bc8:3feb:100::5/64",
        ]
      }
    }
  }
}

