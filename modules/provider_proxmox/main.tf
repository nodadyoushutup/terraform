locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
}

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = local.provider.endpoint
  api_token = local.provider.api_token
  insecure  = local.provider.insecure
  ssh {
    agent = true
    agent_socket = 22
    username = local.provider.username
    private_key = file("/mnt/workspace/proxmox.pem")
    node {
      name = "pve"
      address = local.provider.address
    }
  }
}