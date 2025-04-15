output "fr_par1" {
  value = scaleway_instance_server.fr-par1.*.public_ip
}
output "pl_war1" {
  value = scaleway_instance_server.pl-war1.*.public_ip
}
