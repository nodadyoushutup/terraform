# vault/main.tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

# module "vault" {
#   source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
#   version = "0.1.12"
#   ipv4_address  = "192.168.1.101/24"
#   vm_id         = "101"
# }