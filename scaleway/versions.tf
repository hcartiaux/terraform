terraform {
  required_version = ">= 0.13"
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "= 2.2.0"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "= 2.55.0"
    }
  }
}
