# modules/proxmox/virtual_machine/provider.tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint = "https://146.115.179.178:8006/"
  api_token = "root@pve!provider=cd31cf14-ec77-4fb5-ac61-d2db0bd390e1"
  insecure  = true
  ssh {
    agent = true
    agent_socket = 22
    username = "root"
    private_key = file("/mnt/workspace/proxmox.pem")
    node {
      name = "pve"
      address = "146.115.179.178"
    }
  }
}