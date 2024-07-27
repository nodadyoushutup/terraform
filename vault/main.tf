# vault/main.tf

# locals {
#   config = yamldecode(file("/mnt/workspace/provider.yaml"))
# }

# module "vault" {
#   source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
#   version = "0.1.9"

#   address       = local.config.address
#   api_token     = local.config.api_token
#   endpoint      = local.config.endpoint
#   username      = local.config.username
#   insecure      = local.config.insecure
#   ipv4_address  = "192.168.1.101/24"
#   vm_id         = "101"
# }

module "proxmox_provider" {
  source = "spacelift.io/nodadyoushutup/provider_proxmox/proxmox"
}