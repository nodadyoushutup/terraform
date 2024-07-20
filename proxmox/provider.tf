terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint  = var.ENDPOINT
  username  = var.USERNAME
  password  = var.PASSWORD
  insecure  = var.INSECURE
}