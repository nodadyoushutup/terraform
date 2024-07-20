# proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  username  = var.username
  password  = var.password
  insecure  = var.insecure
}