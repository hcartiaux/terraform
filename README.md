# Terraform

This is my own Terraform configuration repository for my homelab.

It is split in three directories:

* `libvirt`, to spawn VMs with cloud-init on my dedibox server.
  The main configuration file is `terraform.tfvars`,
  new VMs can be created by adding new entries in the hash `vms_list`.
  Each VM description will be converted to cloud-init configuration and be
  used to bootstrap the system on boot.

* `scaleway`, for my Scaleway cloud infrastructure

* `oracle`, for my Oracle cloud infrastructure (free tier)

## Configuration analysis

* Verify the terraform HCL code in the current repository: `tflint`
* Reformat the configuration using the official styling guidelines: `terraform fmt`
* Validate the configuration: `terraform validate`

## Workflow

* Prepare the working directory: `terraform init`
* Show changes required by the current configuration: `terraform plan`
* Create or modify the infrastructure: `terraform apply`
* Destroy all the infrastructure: `terraform destroy`

## Tips

* List all resources: `terraform state list`
* Destroy a particular VM: `terraform destroy -target 'module.vms["tf-openbsd"]'`

## Cloud-init

On a booted VM, you can verify the generated cloud-init configuration with this
command as root: `cloud-init schema --system`
