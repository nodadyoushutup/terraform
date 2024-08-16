# modules/proxmox/virtual_machine_simple/provider.tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}