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
#  "tf-debian" = {
#    bridge_name        = "vmbr0"
#    vm_memory          = 256
#    vm_vcpu            = 1
#    vm_disk_size       = 100
#    cloud_image_url    = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
#    network_interfaces = {
#      ens3 = {
#        addresses = [
#          "192.168.0.9/16",
#          "2001:bc8:3feb:100::9/64",
#        ]
#      }
#    }
#    system             = {
#      hostname = "tf-debian"
#      packages = [ "wget" ]
#    }
#    users              = {
#      "hcartiaux" = {
#        shell               = "/bin/bash"
#        sudo                = "ALL=(ALL) NOPASSWD:ALL"
#        hashed_passwd       = "$6$rounds=4096$rh.qC0vBcnT9Xn2R$7kgIGriRsyDdKdgmQczJRasfEaGSojKuyxzmMD9DopM5ZpirMJhmMKFCwjAWzsX9NwswulSIvbbVhEK2XdOkK."
#        lock_passwd         = false
#        ssh_authorized_keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13" ]
#      }
#    }
#  }

  "tf-openbsd" = {
    bridge_name        = "vmbr0"
    vm_memory          = 512
    vm_vcpu            = 1
    vm_disk_size       = 100
    cloud_image_url    = "http://hcartiaux.gforge.uni.lu/openbsd75_2024-04-14.qcow2"
    network_interfaces = {
      vio0 = {
        addresses = [
          "192.168.0.10/16",
          "2001:bc8:3feb:100::10/64",
        ]
      }
    }
    system             = {
      hostname = "tf-openbsd"
      packages = [ "wget", "bash", "vim--no_x11" ]
    }
    users              = {
      "hcartiaux" = {
        shell               = "/usr/local/bin/bash"
        doas                = "permit nopass hcartiaux as root"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "!"
        lock_passwd         = true
        ssh_authorized_keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13" ]
      }
    }
  }
}
