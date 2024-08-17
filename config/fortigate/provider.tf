# config/fortigate/provider.tf

terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}

provider "fortios" {
    hostname = local.provider.fortigate.hostname
    insecure = "true"
    username = local.provider.fortigate.username
    password = local.provider.fortigate.password
}