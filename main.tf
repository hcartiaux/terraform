resource "libvirt_pool" "terraform" {
  name = var.pool_name
  type = "dir"
  path = var.pool_path
}

module "vms" {
  source = "./vms"
  for_each = var.vms_list
  pool_name = libvirt_pool.terraform.name
  bridge_name = each.value.bridge_name
  vm_name = each.key
  vm_memory = each.value.vm_memory
  vm_vcpu = each.value.vm_vcpu
  vm_disk_size = each.value.vm_disk_size
  cloud_image_url = each.value.cloud_image_url
  cloud_init_net_iface = { for iface_name, iface_vals in each.value.cloud_init_net_iface:
    iface_name => merge(var.network_defaults, iface_vals)
  }
}

