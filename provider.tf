terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint  = var.provider_config.endpoint
  username  = var.provider_config.username
  password  = var.provider_config.password
  insecure  = var.provider_config.insecure
}