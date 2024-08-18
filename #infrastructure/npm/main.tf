# infrastructure/npm/main.tf

module "npm" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 103
  name = "npm"
  description = "Nginx Proxy Manager infrastructure"
  tags = ["terraform", "ubuntu", "npm"]
  disk = {
    size = 50
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
        address = "192.168.1.103/24"
        gateway = "192.168.1.1"
      }
    }
  }
}