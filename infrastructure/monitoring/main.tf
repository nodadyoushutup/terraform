# infrastructure/database/main.tf

module "monitoring" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 102
  name = "monitoring"
  description = "Monitoring services"
  tags = ["terraform", "ubuntu", "monitoring"]
  disk = {
    size = 20
  }
  memory = {
    dedicated = 4096
  }
  cpu = {
    cores = 2
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.102/24"
        gateway = "192.168.1.1"
      }
    }
  }
}