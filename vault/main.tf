# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.2.0"
  ipv4_address  = "192.168.1.101/24"
  vm_id         = "101"
  user_account = {
    username = local.virtual_machine.username
    password = local.virtual_machine.password
  }
}