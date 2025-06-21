# variable "zone" {
#   type        = string
#   default     = "fr-par-1"
#   description = "# A region can be split into many availability zones (AZ)."
# }

# variable "region" {
#   type        = string
#   default     = "fr-par"
#   description = "A region is represented as a geographical area such as France (Paris) or the Netherlands (Amsterdam)."
# }

# variable "project_id" {
#   type        = string
#   default     = "11111111-1111-1111-1111-111111111111"
#   description = "Your project ID."
# }

variable "ssh_pub_key" {
  type        = string
  description = "Your SSH public key"
}
