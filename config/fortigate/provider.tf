# config/fortigate/provider.tf

terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}

provider "fortios" {
    hostname = "https://146.115.179.178:443"
    insecure = "true"
    username = local.provider.fortigate.username
    password = local.provider.fortigate.password
    cabundlefile  = "/mnt/workspace/Fortinet_CA_SSL.crt"
}