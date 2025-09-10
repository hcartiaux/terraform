output "fr_par1" {
  value = scaleway_instance_server.fr-par1[*].public_ip
}
output "pl_waw1" {
  value = scaleway_instance_server.pl-war1[*].public_ip
}
output "nl_ams3" {
  value = scaleway_instance_server.nl-ams3[*].public_ip
}
