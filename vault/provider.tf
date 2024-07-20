# proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  # endpoint  = var.endpoint
  # username  = var.username
  # password  = var.password
  # insecure  = var.insecure
  # ssh {
  #   agent = true
  # }
  endpoint = var.endpoint
  api_token = var.api_token
  insecure  = var.insecure
  ssh {
    agent = true
    username = root
  }
}