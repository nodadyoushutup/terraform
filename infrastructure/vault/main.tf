# infrastructure/vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "0.4.5"
  vm_id = 101
  name = "vault"
  description = "HashiCorp Vault"
  tags = ["terraform", "ubuntu", "vault"]
  disk = {
    size = 20
  }
  memory = {
    dedicated = 4096
  }
  cpu = {
    cores = 1
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.101/24"
        gateway = "192.168.1.1"
      }
    }
  }
}