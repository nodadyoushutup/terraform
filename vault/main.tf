# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.1.2"

  # Provider Config
  username = var.username
  password = var.password
  endpoint = var.endpoint
  address = var.address
  insecure = var.insecure
  api_token = var.api_token

  # VM Config
  vm_id = 101
  name = "vault"
  tags = ["terraform", "vault"]
  ipv4_address = "192.168.1.101/24"
  user_account_keys = [
    file("/mnt/workspace/desktop.pub"),
    file("/mnt/workspace/proxmox.pub"),
  ]
  user_account_password = var.password
  ipv4_gateway = "192.168.1.102"
}