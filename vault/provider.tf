# proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = var.endpoint
  api_token = var.api_token
  insecure  = var.insecure
  ssh {
    node {
      name = "pve"
      address = var.address
    }
    agent = true
    agent_socket = 22
    username = var.username
    # password = var.password
  }
}