provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token
  insecure  = var.insecure

  ssh {
    agent      = true
    username   = var.username
    private_key = var.private_key
  }
}
