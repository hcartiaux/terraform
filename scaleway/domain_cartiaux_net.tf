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
resource "scaleway_domain_record" "default_alias" {
  dns_zone = "cartiaux.net"
  type     = "ALIAS"
  data     = "hcartiaux.github.io."
  ttl      = 10800
}
resource "scaleway_domain_record" "www" {
  dns_zone = "cartiaux.net"
  name     = "www"
  type     = "CNAME"
  data     = "cartiaux.net."
  ttl      = 10800
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
