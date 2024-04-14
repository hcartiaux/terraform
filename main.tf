module "vms" {
  source             = "./vms"
  for_each           = var.vms_list
  pool_name          = var.pool_name
  bridge_name        = each.value.bridge_name
  vm_name            = each.key
  vm_memory          = each.value.vm_memory
  vm_vcpu            = each.value.vm_vcpu
  vm_disk_size       = each.value.vm_disk_size
  cloud_image_url    = each.value.cloud_image_url
  network_interfaces = { for iface_name, iface_vals in each.value.network_interfaces:
    iface_name => merge(var.network_defaults, iface_vals)
  }
  system             = merge(var.system_defaults, each.value.system)
  users              = merge(var.users_defaults, each.value.users)
}

