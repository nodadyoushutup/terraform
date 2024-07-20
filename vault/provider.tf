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
      address = "146.115.179.178"
    }
    agent = true
    agent_socket = 22
    username = var.username
    # password = var.password
  }
}