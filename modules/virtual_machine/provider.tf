# proxmox/provider./tf

locals {
  provider_proxmox = yamldecode(file("/mnt/workspace/provider_proxmox.yaml"))
}

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = local.provider_proxmox.endpoint
  api_token = local.provider_proxmox.api_token
  insecure  = local.provider_proxmox.insecure
  ssh {
    agent = true
    agent_socket = 22
    username = local.provider_proxmox.username
    private_key = file("/mnt/workspace/proxmox.pem")
    node {
      name = local.provider_proxmox.node_name
      address = local.provider_proxmox.node_address
    }
  }
}