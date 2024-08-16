# modules/proxmox/virtual_machine_simple/main.tf

# locals {
#   virtual_machine = yamldecode(file("/mnt/workspace/virtual_machine.yaml"))
#   provider = yamldecode(file("/mnt/workspace/provider.yaml"))
# }

resource "proxmox_virtual_environment_vm" "vault" {
  vm_id = var.vm_id
  name = var.name
  description = var.description
  tags = var.tags
  node_name = var.node_name
  on_boot = var.on_boot
  started = var.started
  stop_on_destroy = var.stop_on_destroy
  boot_order = var.boot_order
  agent {
    enabled = false
  }
  disk {
    datastore_id = var.disk.datastore_id
    file_id = var.disk.file_id
    interface = var.disk.interface
    size = var.disk.size
  }
  memory {
    dedicated = var.memory.dedicated
  }
  cpu {
    sockets = var.cpu.sockets
    cores = var.cpu.cores
  }
  initialization {
    ip_config {
      ipv4 {
        address = var.initialization.ip_config.ipv4.address
        gateway = var.initialization.ip_config.ipv4.gateway
      }
    }
    user_account {
      username = try(try(local.virtual_machine.username, var.initialization.user_account.username), null)
      password = try(try(local.virtual_machine.password, var.initialization.user_account.password), null)
      keys = try(try(local.virtual_machine.keys, var.initialization.user_account.keys), null)
    }
  }
}
