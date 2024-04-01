variable "server_uri" {
  type = string
}

variable "pool_name" {
  type = string
}
variable "pool_path" {
  type = string
}

variable "network_defaults" {
  type = object({
    gateway4 = string
    gateway6 = string
    nameservers = list(string)
  })
}

variable "system_defaults" {
  type = object({
    domain = string
    timezone = optional(string)
    disable_root = optional(bool)
    ssh_pwauth = optional(bool)
    package_upgrade = optional(bool)
  })
}

variable "users_defaults" {
  type = map(object({
    shell = optional(string)
    sudo = optional(string)
    hashed_passwd = optional(string)
    lock_passwd = optional(bool)
    ssh_authorized_keys = optional(list(string))
  }))
}

variable "vms_list" {
  type = map(object({
    vm_memory = number
    vm_vcpu = number
    vm_disk_size = number
    bridge_name = string
    cloud_image_url = string
    network_interfaces = map(object({
      addresses = list(string)
    }))
    system = object({
      hostname = string
      packages = optional(list(string))
    })
    users = map(object({
      shell = optional(string)
      sudo = optional(string)
      hashed_passwd = optional(string)
      lock_passwd = optional(bool)
      ssh_authorized_keys = optional(list(string))
    }))
  }))
}

