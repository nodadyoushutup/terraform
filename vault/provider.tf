# proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

resource "local_file" "ssh_key" {
  content  = var.private_key
  filename = "${path.module}/id_rsa.pem"
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
    # password = var.password
    private_key = file("${local_file.ssh_key.filename}")
  }
}