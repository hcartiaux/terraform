###
# Scaleway account main ssh public key
###

resource "scaleway_account_ssh_key" "main" {
    name       = "main"
    public_key = var.ssh_pub_key
}

###
# Cloud-init
###

data "template_file" "userdata" {
  template = file("${path.module}/cloud-init.yaml")

  vars = {
    ssh_pub_key = var.ssh_pub_key
  }
}
