# modules/proxmox/virtual_machine/main.tf

resource "proxmox_virtual_environment_vm" "virtual_machine" {
  vm_id     = var.vm.id
  name      = var.vm.name
  tags      = var.vm.tags
  node_name = var.vm.node_name
  
  on_boot   = var.vm.on_boot
  started   = var.vm.started
  stop_on_destroy = var.vm.stop_on_destroy
  
  ###
  acpi = var.acpi
  agent {
    enabled = var.agent.enabled
    timeout = var.agent.timeout
    trim = var.agent.trim
    type = var.agent.type
  }
  audio_device {
    device = var.audio_device.device
    driver = var.audio_device.driver
    enabled = var.audio_device.enabled
  }
  bios  = var.bios
  boot_order = var.boot_order
  cdrom {
    enabled = var.cdrom.enabled
    file_id = var.cdrom.file_id
    interface = var.cdrom.interface
  }
  ###

  initialization {
    ip_config {
      ipv4 {
        address = var.initialization.ip_config.ipv4.address
        gateway = var.initialization.ip_config.ipv4.gateway
      }
    }
    user_account {
      keys     = var.initialization.user_account.keys
      password = var.initialization.user_account.password
      username = var.initialization.user_account.username
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
