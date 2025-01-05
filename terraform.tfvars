server_uri = "qemu+ssh://hcartiaux@51.158.153.183/system"
pool_name  = "terraform"
pool_path  = "/var/lib/libvirt/terraform"

network_defaults = {
  gateway4    = "192.168.0.1"
  gateway6    = "2001:bc8:3feb:100::2"
  nameservers = ["2001:bc8:3feb:100::2"]
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
  "dn42-fr-ams1" = {
    bridge_name     = "vmbr0"
    vm_memory       = 384
    vm_vcpu         = 1
    vm_disk_size    = 100
    cloud_image_url = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.9/16",
          "2001:bc8:3feb:100::9/64",
        ]
      }
    }
    system = {
      hostname = "dn42-fr-ams1"
      packages = ["wget"]
    }
    users = {
      "hcartiaux" = {
        shell               = "/bin/bash"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "!"
        lock_passwd         = true
        ssh_authorized_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13"]
      }
    }
  }
  "dn42-nl-ams2" = {
    bridge_name     = "vmbr0"
    vm_memory       = 384
    vm_vcpu         = 1
    vm_disk_size    = 100
    cloud_image_url = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.6/16",
          "2001:bc8:3feb:100::6/64",
        ]
      }
    }
    system = {
      hostname = "dn42-nl-ams2"
      packages = ["wget"]
    }
    users = {
      "hcartiaux" = {
        shell               = "/bin/bash"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "!"
        lock_passwd         = true
        ssh_authorized_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13"]
      }
    }
  }
  "dn42-flipflapix" = {
    bridge_name     = "vmbr0"
    vm_memory       = 384
    vm_vcpu         = 1
    vm_disk_size    = 100
    cloud_image_url = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.8/16",
          "2001:bc8:3feb:100::6/64",
        ]
      }
    }
    system = {
      hostname = "dn42-flipflapix"
      packages = ["wget"]
    }
    users = {
      "hcartiaux" = {
        shell               = "/bin/bash"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "!"
        lock_passwd         = true
        ssh_authorized_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13"]
      }
    }
  }

  "shell" = {
    bridge_name     = "vmbr0"
    vm_memory       = 512
    vm_vcpu         = 1
    vm_disk_size    = 100
    cloud_image_url = "https://github.com/hcartiaux/openbsd-cloud-image/releases/download/v7.6_2024-10-08-22-40/openbsd-min.qcow2"
    network_interfaces = {
      vio0 = {
        addresses = [
          "192.168.0.10/16",
          "2001:bc8:3feb:100::10/64",
        ]
      }
    }
    system = {
      hostname = "shell"
      packages = ["wget", "bash", "vim--no_x11"]
    }
    users = {
      "hcartiaux" = {
        shell               = "/usr/local/bin/bash"
        doas                = "permit nopass hcartiaux as root"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "!"
        lock_passwd         = true
        ssh_authorized_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13"]
      }
    }
  }

}
