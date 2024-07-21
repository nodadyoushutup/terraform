# modules/vm/main.tf

resource "proxmox_virtual_environment_vm" "virtual_machine" {
  vm_id     = var.vm_id
  name      = var.name
  tags      = var.tags
  node_name = var.node_name
  bios      = var.bios
  on_boot   = var.on_boot
  started   = var.started
  stop_on_destroy = var.stop_on_destroy
  agent {
    enabled = var.agent_enabled
  }
  initialization {
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }
    user_account {
      keys     = var.user_account_keys
      password = var.user_account_password
      username = var.user_account_username
    }
  }
  disk {
    datastore_id  = var.disk_datastore_id
    file_id       = var.disk_file_id
    interface     = var.disk_interface
    discard       = var.disk_discard
    size          = var.disk_size
    ssd           = var.disk_ssd
  }
  network_device {
    bridge = var.network_bridge
    model = var.network_model
  }
  memory {
    dedicated = var.memory_dedicated
  }
  cpu {
    cores = var.cpu_cores
    sockets = var.cpu_sockets
    type = var.cpu_type
    numa = var.cpu_numa
  }
}

