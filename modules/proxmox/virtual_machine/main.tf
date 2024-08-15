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
  for_each = var.disk != null && length(var.disk) > 0 ? { for i, d in var.disk : i => d } : {}
  content {
    aio = lookup(disk.value, "aio", null)
    backup = lookup(disk.value, "backup", null)
    cache = lookup(disk.value, "cache", null)
    datastore_id = lookup(disk.value, "datastore_id", null)
    path_in_datastore = lookup(disk.value, "path_in_datastore", null)
    discard = lookup(disk.value, "discard", null)
    file_format = lookup(disk.value, "file_format", null)
    file_id = lookup(disk.value, "file_id", null)
    interface = lookup(disk.value, "interface", null)
    iothread = lookup(disk.value, "iothread", null)
    replicate = lookup(disk.value, "replicate", null)
    serial = lookup(disk.value, "serial", null)
    size = lookup(disk.value, "size", null)
    ssd = lookup(disk.value, "ssd", null)
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
