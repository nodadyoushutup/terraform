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
      datastore_id  = lookup(var.clone, "datastore_id", null)
      node_name  = lookup(var.clone, "node_name", null)
      retries = lookup(var.clone, "retries", null)
      vm_id = lookup(var.clone, "vm_id", null)
      full = lookup(var.clone, "full", null)
    }
  }
  dynamic "cpu" {
    for_each = var.cpu != null && var.cpu != {} ? [1] : []
    content {
      architecture  = lookup(var.cpu, "architecture", null)
      cores  = lookup(var.cpu, "cores", null)
      flags = lookup(var.cpu, "flags", null)
      hotplugged = lookup(var.cpu, "hotplugged", null)
      limit = lookup(var.cpu, "limit", null)
      numa = lookup(var.cpu, "numa", null)
      sockets = lookup(var.cpu, "sockets", null)
      type = lookup(var.cpu, "type", null)
      units = lookup(var.cpu, "units", null)
      affinity = lookup(var.cpu, "affinity", null)
    }
  }
  description = var.description
  dynamic "disk" {
    for_each = var.disk != null && length(var.disk) > 0 ? var.disk : []
    content {
      aio = lookup(each.value, "aio", null)
      backup = lookup(each.value, "backup", null)
      cache = lookup(each.value, "cache", null)
      datastore_id = lookup(each.value, "datastore_id", null)
      path_in_datastore = lookup(each.value, "path_in_datastore", null)
      discard = lookup(each.value, "discard", null)
      file_format = lookup(each.value, "file_format", null)
      file_id = lookup(each.value, "file_id", null)
      interface = lookup(each.value, "interface", null)
      iothread = lookup(each.value, "iothread", null)
      replicate = lookup(each.value, "replicate", null)
      serial = lookup(each.value, "serial", null)
      size = lookup(each.value, "size", null)
      ssd = lookup(each.value, "ssd", null)
      speed_config = lookup(each.value, "speed", null)
      dynamic "speed" {
        for_each = speed_config.value != null && speed_config.value != {} ? [1] : []
        content {
          iops_read = lookup(speed_config.value, "iops_read", null)
          iops_read_burstable = lookup(speed_config.value, "iops_read_burstable", null)
          iops_write = lookup(speed_config.value, "iops_write", null)
          iops_write_burstable = lookup(speed_config.value, "iops_write_burstable", null)
          read = lookup(speed_config.value, "read", null)
          read_burstable = lookup(speed_config.value, "read_burstable", null)
          write = lookup(speed_config.value, "write", null)
          write_burstable = lookup(speed_config.value, "write_burstable", null)
        }
      }
    }
  }
  ###

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

  network_device {
    bridge = var.network.bridge
    model  = var.network.model
  }

  memory {
    dedicated = var.memory.dedicated
  }
}
