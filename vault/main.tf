# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.1.14"
  ipv4_address  = "192.168.1.101/24"
  vm_id         = "101"
  user_account_username = local.virtual_machine.username
  user_account_password = local.virtual_machine.password
}