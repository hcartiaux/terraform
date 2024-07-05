# Terraform

This is my own Terraform configuration repository for my homelab, based on libvirt and cloud-init system images.

The main configuration file is `terraform.tfvars`, new VMs can be created by adding new entries in the hash `vms_list`. Each VM description will be converted to cloud-init configuration and be used to bootstrap the system on boot.

## Configuration analysis

* Verify the terraform HCL code in the current repository: `tflint`
* Reformat the configuration using the official styling guidelines: `terraform fmt`
* Validate the configuration: `terraform validate`

## Workflow

* Prepare the working directory: `terraform init`
* Show changes to the infrastructure required by the current configuration: `terraform plan`
* Create or modify the infrastructure: `terraform apply`
* Destroy all the infrastructure: `terraform destroy`

## Tips

* List all resources: `terraform state list`
* Destroy a particular VM: `terraform destroy -target 'module.vms["tf-openbsd"]'`

# Cloud-init

On a booted VM, you can verify the generated cloud-init configuration with this command as root: `cloud-init schema --system`

# External resources

* https://www.freecodecamp.org/news/terraform-modules-explained/
* https://spacelift.io/blog/terraform-files
* https://spacelift.io/blog/how-to-use-terraform-variables
* https://cloud.google.com/docs/terraform/best-practices-for-terraform
* https://www.digitalocean.com/community/tutorial-series/how-to-manage-infrastructure-with-terraform
* https://www.digitalocean.com/community/tutorials/how-to-structure-a-terraform-project
* https://github.com/github/gitignore/blob/main/Terraform.gitignore
