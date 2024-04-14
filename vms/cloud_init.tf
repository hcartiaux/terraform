# Produced from the cloud-init yaml configuration
# echo 'yamldecode(file("vms/network_config.cfg"))' | terraform console
locals {
  user_data = {
    "hostname"        = var.system.hostname
    "fqdn"            = "${var.system.hostname}.${var.system.domain}"
    "timezone"        = var.system.timezone
    "disable_root"    = var.system.disable_root
    "ssh_pwauth"      = var.system.ssh_pwauth
    "package_upgrade" = var.system.package_upgrade
    "packages"        = var.system.packages
    "users"           = [
      for user_name, user_vals in var.users:
        {
          "name"                = user_name
          "shell"               = user_vals.shell
          "sudo"                = user_vals.sudo
          "doas"                = [ user_vals.doas ]
          "hashed_passwd"       = user_vals.hashed_passwd
          "lock_passwd"         = user_vals.lock_passwd
          "ssh_authorized_keys" = user_vals.ssh_authorized_keys
        }
    ]
    "growpart"        = {
      "devices" = [ "/" ]
      "mode"    = "auto"
    }
  }
  network_config = {
    "version" = 2
    "ethernets" = {
      for iface_name, iface_vals in var.network_interfaces:
        iface_name => {
          addresses   = iface_vals.addresses
          gateway4    = iface_vals.gateway4
          gateway6    = iface_vals.gateway6
#         routes      = [
#           {
#             "to" = "0.0.0.0"
#             "via" = iface_vals.gateway4
#           },
#           {
#             "to" = "::/0"
#             "via" = iface_vals.gateway6
#           }
#         ]
          nameservers = {
            addresses = iface_vals.nameservers
          }
        }
    }
  }
}

