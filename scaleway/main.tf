###
# Scaleway account main ssh public key
###

resource "scaleway_account_ssh_key" "main" {
    name       = "main"
    public_key = var.ssh_pub_key
}

###
# Cartiaux.net zone configuration
###

resource "scaleway_domain_record" "ns0-scw" {
  dns_zone = "cartiaux.net"
  type     = "NS"
  data     = "ns0.dom.scw.cloud."
  ttl      = 1800
}
resource "scaleway_domain_record" "ns1-scw" {
  dns_zone = "cartiaux.net"
  type     = "NS"
  data     = "ns1.dom.scw.cloud."
  ttl      = 1800
}
resource "scaleway_domain_record" "mx1" {
  dns_zone = "cartiaux.net"
  type     = "MX"
  priority = 10
  data     = "smtpin-01.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "mx2" {
  dns_zone = "cartiaux.net"
  type     = "MX"
  priority = 50
  data     = "smtpin-02.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "spf" {
  dns_zone = "cartiaux.net"
  type     = "TXT"
  data     = "v=spf1 include:spf.galae.net ?all"
  ttl      = 10800
}
resource "scaleway_domain_record" "dkim" {
  dns_zone = "cartiaux.net"
  name     = "dkim._domainkey"
  type     = "TXT"
  data     = "v=DKIM1;k=rsa;t=s;s=email;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApLDD6mRdj6XrKM/TcE4f3hYifngV2AqH2Y4vl8JheGk0jIvDCoDPxb7eTl0G432NzyqEQ9vW5TqYB23avMmz2ZEw8kTwY1cQYlKC2dDgcyeApXxpgSsp9AK2lXisMVz7yZzasac1mQbKbyLjt1j2DnaCamnuVUY6TbJJGgejNva7vsPLdJhdaeYpnl7FW7GhZkGEqZhcmmxArMYLDzbONQTd2zUMY9qGa2/Nsds+o/e/AD+gZVKtd2WdL/VZRdjFrWpYGgbwVMoPHVKjOPWy47qZd2GY+CjPazcV7EuC6dspmy8kw01py437w/JqSIPUV0ZvbNqaG4E/ZP2AHMN4NwIDAQAB"
  ttl      = 10800
}
resource "scaleway_domain_record" "dmarc" {
  dns_zone = "cartiaux.net"
  name     = "_dmarc"
  type     = "TXT"
  data     = "v=DMARC1; p=reject;"
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_autodiscover" {
  dns_zone = "cartiaux.net"
  name     = "_autodiscover._tcp"
  type     = "SRV"
  data     = "0 1 443 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_caldavs" {
  dns_zone = "cartiaux.net"
  name     = "_caldavs._tcp"
  type     = "SRV"
  data     = "0 1 443 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "txt_caldavs" {
  dns_zone = "cartiaux.net"
  name     = "_caldavs._tcp"
  type     = "TXT"
  data     = "path=/SOGo/dav/"
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_carddavs" {
  dns_zone = "cartiaux.net"
  name     = "_carddavs._tcp"
  type     = "SRV"
  data     = "0 1 443 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "txt_carddavs" {
  dns_zone = "cartiaux.net"
  name     = "_carddavs._tcp"
  type     = "TXT"
  data     = "path=/SOGo/dav/"
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_imap" {
  dns_zone = "cartiaux.net"
  name     = "_imap._tcp"
  type     = "SRV"
  data     = "0 1 143 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_imaps" {
  dns_zone = "cartiaux.net"
  name     = "_imaps._tcp"
  type     = "SRV"
  data     = "0 1 993 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_pop3" {
  dns_zone = "cartiaux.net"
  name     = "_pop3._tcp"
  type     = "SRV"
  data     = "0 1 110 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_pop3s" {
  dns_zone = "cartiaux.net"
  name     = "_pop3s._tcp"
  type     = "SRV"
  data     = "0 1 995 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_sieve" {
  dns_zone = "cartiaux.net"
  name     = "_sieve._tcp"
  type     = "SRV"
  data     = "0 1 4190 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_smtps" {
  dns_zone = "cartiaux.net"
  name     = "_smtps._tcp"
  type     = "SRV"
  data     = "0 1 465 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "srv_submission" {
  dns_zone = "cartiaux.net"
  name     = "_submission._tcp"
  type     = "SRV"
  data     = "0 1 587 mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "cname_autoconfig" {
  dns_zone = "cartiaux.net"
  name     = "autoconfig"
  type     = "CNAME"
  data     = "mail.galae.net."
  ttl      = 10800
}
resource "scaleway_domain_record" "cname_autodiscover" {
  dns_zone = "cartiaux.net"
  name     = "autodiscover"
  type     = "CNAME"
  data     = "mail.galae.net."
  ttl      = 10800
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
