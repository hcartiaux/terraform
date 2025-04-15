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
# Instances
###

# dn42 node pl-war1
resource "scaleway_instance_ip" "pl_war1_ipv6" {
  type = "routed_ipv6"
  zone = "pl-waw-2"
}
resource "scaleway_instance_server" "pl-war1" {
  name = "pl-war1.flap42.eu"
  zone = "pl-waw-2"
  type = "STARDUST1-S"
  image = "debian_bookworm"

  # No IPv4 configuration
  enable_dynamic_ip = false

  # Attach the IPv6 address
  ip_id = scaleway_instance_ip.pl_war1_ipv6.id

  tags = [ "dn42" ]
}

# dn42 node fr-par1
resource "scaleway_instance_ip" "fr_par1_ipv6" {
  type = "routed_ipv6"
  zone = "fr-par-1"
}
resource "scaleway_instance_server" "fr-par1" {
  name = "fr-par1.flap42.eu"
  zone = "fr-par-1"
  type = "STARDUST1-S"
  image = "debian_bookworm"

  # No IPv4 configuration
  enable_dynamic_ip = false

  # Attach the IPv6 address
  ip_id = scaleway_instance_ip.fr_par1_ipv6.id

  tags = [ "dn42" ]
}
