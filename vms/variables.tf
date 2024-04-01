variable "pool_name" {
  description = "Storage pool name"
  type        = string
  default     = "default"
  nullable    = false
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  nullable    = false
}

variable "vm_memory" {
  description = "Virtual machine memory (MB)"
  type        = number
  default     = 512
  nullable    = false
}

variable "vm_vcpu" {
  description = "Virtual machine CPU #"
  type        = number
  default     = 1
  nullable    = false
}

variable "vm_disk_size" {
  description = "Virtual machine CPU #"
  type        = number
  default     = 5361393152
  nullable    = false
}

variable "bridge_name" {
  description = "Host bridge interface name"
  type        = string
  default     = "vmbr0"
  nullable    = false
}

variable "cloud_image_url" {
  description = "Cloud image URL"
  type        = string
  default     = "https://cloud-images.ubuntu.com/releases/23.10/release/ubuntu-23.10-server-cloudimg-amd64.img"
  nullable    = false
}

# cloud_init_disable_root
# cloud_init_ssh_pwauth
# cloud_init_root_password_hash
# cloud_init_root_password_locked
# cloud_init_root_authorized_keys
# cloud_init_user_name
# cloud_init_user_shell
# cloud_init_user_sudo_configuration
# cloud_init_user_password_hash
# cloud_init_user_password_locked
# cloud_init_user_authorized_keys

variable "network_interfaces" {
  description = "Network interfaces configuration"
  type = map(object({
    addresses = list(string)
    gateway4 = string
    gateway6 = string
    nameservers = list(string)
  }))
  default = {
    "ens3" = {
      "addresses" = [
        "192.168.0.42/16",
        "2001:bc8:3feb:100::42/64",
      ]
      "gateway4" = "192.168.0.1"
      "gateway6" = "2001:bc8:3feb:100::2"
      "nameservers" = [
          "2001:bc8:3feb:100::2",
      ]
    }
  }
}
