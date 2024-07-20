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
    agent = true
    agent_socket = 22
    node {
      name = "pve"
      address = var.address
    }
    username = var.username
    # password = var.password
    private_key = <<-EOF
${var.private_key}
EOF
  }
}