# modules/proxmox/virtual_machine/main.tf

resource "proxmox_virtual_environment_vm" "virtual_machine" {
  vm_id     = var.vm.id
  name      = var.vm.name
  tags      = var.vm.tags
  node_name = var.vm.node_name
  bios      = var.vm.bios
  on_boot   = var.vm.on_boot
  started   = var.vm.started
  stop_on_destroy = var.vm.stop_on_destroy

  agent {
    enabled = var.agent.enabled
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.network.ipv4_address
        gateway = var.network.ipv4_gateway
      }
    }
    user_account {
      keys     = var.user_account.keys
      password = var.user_account.password
      username = var.user_account.username
    }
  }

  disk {
    datastore_id  = var.disk.datastore_id
    file_id       = var.disk.file_id
    interface     = var.disk.interface
    discard       = var.disk.discard
    size          = var.disk.size
    ssd           = var.disk.ssd
  }

  network_device {
    bridge = var.network.bridge
    model  = var.network.model
  }

  memory {
    dedicated = var.memory.dedicated
  }

  cpu {
    cores   = var.cpu.cores
    sockets = var.cpu.sockets
    type    = var.cpu.type
    numa    = var.cpu.numa
  }
}
