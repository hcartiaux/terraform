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
