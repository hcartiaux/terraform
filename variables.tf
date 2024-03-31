variable "pool_name" {
  type = string
}
variable "pool_path" {
  type = string
}

variable "vms_list" {
  type = map(object({
    vm_memory = number
    vm_vcpu = number
    vm_disk_size = number
    bridge_name = string
    cloud_image_url = string
  }))
}

