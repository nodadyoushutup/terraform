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
  dynamic "agent" {
    for_each = var.agent != null && var.agent != {} ? [1] : []
    content {
      enabled = lookup(var.agent, "enabled", null)
      timeout = lookup(var.agent, "timeout", null)
      trim    = lookup(var.agent, "trim", null)
      type    = lookup(var.agent, "type", null)
    }
  }
  dynamic "audio_device" {
    for_each = var.audio_device != null && var.audio_device != {} ? [1] : []
    content {
      device  = lookup(var.audio_device, "device", null)
      driver  = lookup(var.audio_device, "driver", null)
      enabled = lookup(var.audio_device, "enabled", null)
    }
  }
  bios  = var.bios
  boot_order = var.boot_order
  dynamic "cdrom" {
    for_each = var.cdrom != null && var.cdrom != {} ? [1] : []
    content {
      enabled  = lookup(var.cdrom, "enabled", null)
      file_id  = lookup(var.cdrom, "file_id", null)
      interface = lookup(var.cdrom, "interface", null)
    }
  }
  dynamic "clone" {
    for_each = var.clone != null && var.clone != {} ? [1] : []
    content {
      file_id  = lookup(var.clone, "file_id", null)
      retries = lookup(var.clone, "retries", null)
      vm_id = lookup(var.clone, "vm_id", null)
      full = lookup(var.clone, "full", null)
    }
  }
  ###

  # initialization {
  #   ip_config {
  #     ipv4 {
  #       address = var.initialization.ip_config.ipv4.address
  #       gateway = var.initialization.ip_config.ipv4.gateway
  #     }
  #   }
  #   user_account {
  #     keys     = var.initialization.user_account.keys
  #     password = var.initialization.user_account.password
  #     username = var.initialization.user_account.username
  #   }
  # }

  dynamic "initialization" {
    for_each = var.initialization != null && var.initialization != {} ? [1] : []
    content {
      dynamic "ip_config" {
        for_each = var.initialization.ip_config != null && var.initialization.ip_config != {} ? [1] : []
        content {
          dynamic "ipv4" {
            for_each = var.initialization.ip_config.ipv4 != null && var.initialization.ip_config.ipv4 != {} ? [1] : []
            content {
              address = lookup(var.initialization.ip_config.ipv4, "address", null)
              gateway = lookup(var.initialization.ip_config.ipv4, "gateway", null)
            }
          }
        }
      }
      dynamic "user_account" {
        for_each = var.initialization.user_account != null && var.initialization.user_account != {} ? [1] : []
        content {
          keys     = lookup(var.initialization.user_account, "keys", null)
          password = lookup(var.initialization.user_account, "password", null)
          username = lookup(var.initialization.user_account, "username", null)
        }
      }
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
