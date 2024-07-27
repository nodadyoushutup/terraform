# modules/proxmox/virtual_machine/variable.tf

variable "vm" {
  description = "Virtual machine details"
  type = object({
    id = string
    name = string
    tags = list(string)
    node_name = string
    bios = string
    on_boot = bool
    started = bool
    stop_on_destroy = bool
  })
  default = {
    id = "100"
    name = "ubuntu"
    tags = ["terraform"]
    node_name = "pve"
    bios = "seabios"
    on_boot = false
    started = false
    stop_on_destroy = true
  }
}

variable "agent" {
  description = "Agent settings"
  type = object({
    enabled = bool
  })
  default = {
    enabled = false
  }
}

variable "initialization" {
  type = object({
    ip_config = object({
      ipv4 = object({
        address = string
        gateway = string
      })
    })
    user_account = object({
      keys = list(string)
      password = string
      username = string
    })
  })
}

variable "network" {
  description = "Network configuration"
  type = object({
    bridge = string
    model = string
  })
  default = {
    bridge = "vmbr0"
    model = "e1000e"
  }
}

variable "disk" {
  description = "Disk configuration"
  type = object({
    datastore_id = string
    file_id = string
    interface = string
    discard = string
    size = number
    ssd = bool
  })
  default = {
    datastore_id = "local-lvm"
    file_id = "local:iso/jammy-server-cloudimg-amd64.img"
    interface = "scsi0"
    discard = "on"
    size = 50
    ssd = true
  }
}

variable "memory" {
  description = "Memory configuration"
  type = object({
    dedicated = number
  })
  default = {
    dedicated = 4096
  }
}

variable "cpu" {
  description = "CPU configuration"
  type = object({
    cores = number
    sockets = number
    type = string
    numa = bool
  })
  default = {
    cores = 2
    sockets = 1
    type = "host"
    numa = true
  }
}
