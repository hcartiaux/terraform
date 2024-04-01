# Produced from the cloud-init yaml configuration
# echo 'yamldecode(file("vms/network_config.cfg"))' | terraform console
locals {
  user_data = {
    "hostname" = "ubuntu-terraform"
    "fqdn" = "ubuntu-terraform.nbsdn.fr.eu.org"
    "timezone" = "Europe/Paris"
    "disable_root" = true
    "ssh_pwauth" = false
    "growpart" = {
      "devices" = [
        "/",
      ]
      "mode" = "auto"
    }
    "package_upgrade" = true
    "packages" = [
      "bash",
      "git",
      "rsync",
      "vim",
      "curl",
      "wget",
    ]
    "users" = [
      {
        "name" = "root"
        "hashed_passwd" = "$6$rounds=4096$rh.qC0vBcnT9Xn2R$7kgIGriRsyDdKdgmQczJRasfEaGSojKuyxzmMD9DopM5ZpirMJhmMKFCwjAWzsX9NwswulSIvbbVhEK2XdOkK."
        "lock_passwd" = false
        "ssh_authorized_keys" = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13",
        ]
      },
      {
        "name" = "hcartiaux"
        "hashed_passwd" = "$6$rounds=4096$rh.qC0vBcnT9Xn2R$7kgIGriRsyDdKdgmQczJRasfEaGSojKuyxzmMD9DopM5ZpirMJhmMKFCwjAWzsX9NwswulSIvbbVhEK2XdOkK."
        "lock_passwd" = false
        "shell" = "/bin/bash"
        "ssh_authorized_keys" = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICtAyNLxu6GqPOLQutasE70tPMOSF+WS9LmK6kldYwPD hcartiaux@hc-xps13",
        ]
        "sudo" = "ALL=(ALL) NOPASSWD:ALL"
      },
    ]
  }


  network_config = {
    "version" = 2
    "ethernets" = {
      "ens3" = {
        "addresses" = [
          "192.168.0.5/16",
          "2001:bc8:3feb:100::5/64",
        ]
        "gateway4" = "192.168.0.1"
        "gateway6" = "2001:bc8:3feb:100::2"
        "nameservers" = {
          "addresses" = [
            "2001:bc8:3feb:100::2",
          ]
        }
      }
    }
  }
}

