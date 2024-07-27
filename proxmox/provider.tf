# proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

# provider "proxmox" {
#   endpoint = var.endpoint
#   api_token = var.api_token
#   insecure  = var.insecure
#   ssh {
#     agent = true
#     agent_socket = 22
#     username = var.username
#     private_key = file("/mnt/workspace/proxmox.pem")
#     node {
#       name = "pve"
#       address = var.address
#     }
#   }
# }

module "proxmox_provider" {
  source = "spacelift.io/nodadyoushutup/provider_proxmox/proxmox"
  version = "0.1.1"
}