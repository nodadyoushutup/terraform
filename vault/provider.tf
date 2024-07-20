# proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "proxmox" {
  endpoint = var.endpoint
  api_token = var.api_token
  insecure  = var.insecure
  ssh {
    agent = true
    agent_socket = 22
    node {
      name = "pve"
      address = var.address
    }
    username = var.username
    private_key = file("/mnt/workspace/id_rsa")
  }
}