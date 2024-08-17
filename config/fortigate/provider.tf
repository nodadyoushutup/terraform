# config/fortigate/provider.tf

terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}

provider "fortios" {
    hostname = "http://146.115.179.178:7013"
    insecure = "true"
    username = local.provider.fortigate.username
    password = local.provider.fortigate.password
    cabundlefile  = "/mnt/workspace/Fortinet_CA_SSL.crt"
}