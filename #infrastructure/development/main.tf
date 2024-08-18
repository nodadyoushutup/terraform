# infrastructure/development/main.tf

module "development" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 105
  name = "development"
  description = "Code development"
  tags = ["terraform", "ubuntu", "development"]
  disk = {
    size = 50
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
        address = "192.168.1.105/24"
        gateway = "192.168.1.1"
      }
    }
  }
}