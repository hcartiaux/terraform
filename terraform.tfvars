server_uri = "qemu+ssh://hcartiaux@srv.nbsdn.fr.eu.org:222/system"
pool_name  = "terraform"
pool_path  = "/var/lib/libvirt/terraform"

network_defaults = {
  gateway4    = "192.168.0.1"
  gateway6    = "2001:bc8:3feb:100::2"
  nameservers = [ "2001:bc8:3feb:100::2" ]
}

system_defaults = {
  domain          = "nbsdn.fr.eu.org"
  timezone        = "Europe/Paris"
  disable_root    = true
  ssh_pwauth      = false
  package_upgrade = true
}

users_defaults = {
  "root" = {
    hashed_passwd = "!"
    lock_passwd   = true
  }
}

vms_list = {
  "ubuntu-terraform" = {
    bridge_name        = "vmbr0"
    vm_memory          = 512
    vm_vcpu            = 1
    vm_disk_size       = 10361393152
    cloud_image_url    = "https://cloud-images.ubuntu.com/releases/23.10/release/ubuntu-23.10-server-cloudimg-amd64.img"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.5/16",
          "2001:bc8:3feb:100::5/64",
        ]
      }
    }
    system             = {
      hostname = "ubuntu-terraform"
      packages = [ "wget" ]
    }
    users              = {
      "hcartiaux" = {
        shell               = "/bin/bash"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "$6$rounds=4096$rh.qC0vBcnT9Xn2R$7kgIGriRsyDdKdgmQczJRasfEaGSojKuyxzmMD9DopM5ZpirMJhmMKFCwjAWzsX9NwswulSIvbbVhEK2XdOkK." # 1234abcd
        lock_passwd         = false
        ssh_authorized_keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13" ]
      }
    }
  }
}
