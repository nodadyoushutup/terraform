# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/vm/proxmox"
  version = "0.0.1"

  # Provider Config
  username = var.username
  password = var.password
  endpoint = var.endpoint
  address = var.address
  insecure = var.insecure
  api_token = var.api_token

  # VM Config
  name = "vault2"

}