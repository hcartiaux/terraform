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
resource "scaleway_domain_record" "ns2-glue-ip4" {
  dns_zone = "flap42.eu"
  name     = "ns2"
  type     = "A"
  data     = "129.151.240.9"
  ttl      = 3600
}
resource "scaleway_domain_record" "ns2-glue" {
  dns_zone = "flap42.eu"
  name     = "ns2"
  type     = "AAAA"
  data     = "2603:c026:c108:2101:0:f6f8:ce4:397b"
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
