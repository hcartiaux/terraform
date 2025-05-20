###
# Scaleway account main ssh public key
###

resource "scaleway_account_ssh_key" "main" {
    name       = "main"
    public_key = var.ssh_pub_key
}

###
# Flap42.eu zone configuration
###

resource "scaleway_domain_record" "ns1-glue-ip4" {
  dns_zone = "flap42.eu"
  name     = "ns1"
  type     = "A"
  data     = "51.158.153.183"
  ttl      = 3600
}

resource "scaleway_domain_record" "ns1-glue" {
  dns_zone = "flap42.eu"
  name     = "ns1"
  type     = "AAAA"
  data     = "2001:bc8:3feb:100::1"
  ttl      = 3600
}

resource "scaleway_domain_record" "ns2-glue" {
  dns_zone = "flap42.eu"
  name     = "ns2"
  type     = "AAAA"
  data     = "2a13:e3c1:400e:1337::58"
  ttl      = 3600
}

resource "scaleway_domain_record" "ns1" {
  dns_zone = "flap42.eu"
  type     = "NS"
  data     = "ns1.flap42.eu."
  ttl      = 1800
}

resource "scaleway_domain_record" "ns2" {
  dns_zone = "flap42.eu"
  type     = "NS"
  data     = "ns2.flap42.eu."
  ttl      = 1800
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

###
# Instances
###

# dn42 node pl-war1
resource "scaleway_instance_ip" "pl_war1_ipv6" {
  zone = "pl-waw-2"
  type = "routed_ipv6"
}
resource "scaleway_instance_ip_reverse_dns" "pl_war1_ipv6_reverse" {
  zone = "pl-waw-2"
  ip_id = scaleway_instance_ip.pl_war1_ipv6.id
  reverse = "pl-war1.flap42.eu."
}
resource "scaleway_instance_server" "pl-war1" {
  zone = "pl-waw-2"
  name = "pl-war1.flap42.eu"
  type = "STARDUST1-S"
  image = "debian_bookworm"

  # No IPv4 configuration
  enable_dynamic_ip = false

  # Attach the IPv6 address
  ip_id = scaleway_instance_ip.pl_war1_ipv6.id

  # initialization sequence
  cloud_init = data.template_file.userdata.rendered

  tags = [ "dn42" ]
}

# dn42 node fr-par1
resource "scaleway_instance_ip" "fr_par1_ipv6" {
  zone = "fr-par-1"
  type = "routed_ipv6"
}
resource "scaleway_instance_ip_reverse_dns" "fr_par1_ipv6_reverse" {
  zone = "fr-par-1"
  ip_id = scaleway_instance_ip.fr_par1_ipv6.id
  reverse = "fr-par1.flap42.eu."
}
resource "scaleway_instance_server" "fr-par1" {
  zone = "fr-par-1"
  name = "fr-par1.flap42.eu"
  type = "STARDUST1-S"
  image = "debian_bookworm"

  # No IPv4 configuration
  enable_dynamic_ip = false

  # Attach the IPv6 address
  ip_id = scaleway_instance_ip.fr_par1_ipv6.id

  # initialization sequence
  cloud_init = data.template_file.userdata.rendered

  tags = [ "dn42" ]
}
