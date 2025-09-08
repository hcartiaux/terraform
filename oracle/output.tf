output "fr_mrs1_instance_id" {
  description = "The OCID of the instance"
  value       = oci_core_instance.fr_mrs1.id
}

output "fr_mrs1_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = oci_core_instance.fr_mrs1.public_ip
}

output "fr_mrs1_instance_public_ipv6" {
  description = "The public IPv6 address of the instance"
  value       = oci_core_ipv6.public_ipv6_fr_mrs1.ip_address
}

output "fr_mrs1_instance_private_ip" {
  description = "The private IP address of the instance"
  value       = oci_core_instance.fr_mrs1.private_ip
}


output "fr_mrs2_instance_id" {
  description = "The OCID of the instance"
  value       = oci_core_instance.fr_mrs2.id
}

output "fr_mrs2_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = oci_core_instance.fr_mrs2.public_ip
}

output "fr_mrs2_instance_public_ipv6" {
  description = "The public IPv6 address of the instance"
  value       = oci_core_ipv6.public_ipv6_fr_mrs2.ip_address
}

output "fr_mrs2_instance_private_ip" {
  description = "The private IP address of the instance"
  value       = oci_core_instance.fr_mrs2.private_ip
}
