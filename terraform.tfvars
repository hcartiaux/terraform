server_uri = "qemu+ssh://hcartiaux@srv.nbsdn.fr.eu.org:443/system"
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
  "tf-librenms-dn42" = {
    bridge_name     = "vmbr0"
    vm_memory       = 1024
    vm_vcpu         = 1
    vm_disk_size    = 100
    cloud_image_url = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.5/16",
          "2001:bc8:3feb:100::5/64",
        ]
      }
    }
    system = {
      hostname = "librenms-dn42"
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

  "tf-gw2-dn42" = {
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
      hostname = "gw2-dn42"
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

  "tf-bspdestroyer" = {
    bridge_name     = "vmbr0"
    vm_memory       = 300
    vm_vcpu         = 1
    vm_disk_size    = 50
    cloud_image_url = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
    network_interfaces = {
      ens3 = {
        addresses = [
          "192.168.0.7/16",
          "2001:bc8:3feb:100::7/64",
        ]
      }
    }
    system = {
      hostname = "bspdestroyer"
      packages = ["wget"]
    }
    users = {
      "alecomte" = {
        shell               = "/bin/bash"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        hashed_passwd       = "!"
        lock_passwd         = true
        ssh_authorized_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEWD9bAOkDLgzluM70H7JHuphCPXO1REcsEQiku1bdU arnaud@arnaud"]
      }
    }
  }

  "tf-gw-dn42" = {
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
      hostname = "gw-dn42"
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

  "tf-openbsd" = {
    bridge_name     = "vmbr0"
    vm_memory       = 384
    vm_vcpu         = 1
    vm_disk_size    = 100
    cloud_image_url = "http://hcartiaux.gforge.uni.lu/openbsd75_2024-04-14.qcow2"
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
