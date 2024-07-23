# vault/main.tf

locals {
  config = yamldecode(file("/mnt/workspace/provider.yaml"))
}

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.1.9"

  address       = local.config.provider.address
  api_token     = local.config.provider.api_token
  endpoint      = local.config.provider.endpoint
  username      = local.config.provider.username
  insecure      = true
  ipv4_address  = "192.168.1.101/24"
  vm_id         = "101"
}

output "provider_endpoint_value" {
  value = local.config
  description = "Test"
}

