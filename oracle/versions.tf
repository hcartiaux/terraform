terraform {
  required_version = ">= 0.13"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 7.17.0"
    }
  }
}
