# vault/main.tf

# module "vault" {
#   source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
#   version = "0.1.8"

#   # Provider Config
#   username = var.username
#   endpoint = var.endpoint
#   address = var.address
#   insecure = var.insecure
#   api_token = var.api_token

#   # VM Config
#   vm_id = 101
#   name = "vault"
#   tags = ["terraform", "init", "vault"]
#   ipv4_address = "192.168.1.101/24"
#   user_account_keys = [
#     file("/mnt/workspace/desktop.pub"),
#     file("/mnt/workspace/proxmox.pub"),
#   ]
#   user_account_password = var.user_account_password
# }

locals {
  config = yamldecode(file("/mnt/workspace/provider.yaml"))
}

module "virtual_machine" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.1.9"

  address      = local.config.provider.address
  api_token    = local.config.provider.api_token
  endpoint     = local.config.provider.endpoint
  username     = local.config.provider.username
  ipv4_address = "192.168.1.101/24"
  vm_id        = "101"
}

output "provider_endpoint_value" {
  value = local.config
  description = "Test"
}

