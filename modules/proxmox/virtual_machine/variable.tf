# modules/proxmox/virtual_machine/variable.tf

variable "acpi" {
  description = "(Optional) Whether to enable ACPI (defaults to true)."
  type = bool
  default = true
}

variable "agent" {
  description = "(Optional) The QEMU agent configuration."
  type = object({
    enabled = bool
    timeout = string
    trim = bool
    type = string
  })
  default = {
    enabled = false
    timeout = "15m"
    trim = false
    type = "virtio"
  }
  validation {
    condition = can(regex("^\\d+m$", var.agent.timeout))
    error_message = "Invalid timeout format. The timeout should be a number followed by 'm' (e.g., '15m')."
  }
  validation {
    condition = contains(["isa", "virtio"], var.agent.type)
    error_message = "Inalid instance type. Valid options are ['isa', 'virtio']"
  }
}

variable "audio_device" {
  description = "(Optional) An audio device."
  type = object({
    device = string
    driver = string
    enabled = bool
  })
  default = {
    device = "intel-hda"
    driver = "spice"
    enabled = true
  }
  validation {
    condition = contains(["AC97", "ich9-intel-hda", "intel-hda"], var.audio_device.device)
    error_message = "Inalid instance type. Valid options are ['AC97', 'ich9-intel-hda', 'intel-hda']"
  }
  validation {
    condition = contains(["spice"], var.audio_device.driver)
    error_message = "Inalid instance type. Valid options are ['spice']"
  }
}

variable "bios" {
  description = "(Optional) The BIOS implementation (defaults to seabios)."
  type = string
  default = "seabios"
  validation {
    condition = contains(["ovmf", "seabios"], var.bios)
    error_message = "Inalid instance type. Valid options are ['ovmf', 'seabios']"
  }
}

variable "boot_order" {
  description = "(Optional) Specify a list of devices to boot from in the order they appear in the list (defaults to [])."
  type = list(string)
  default = []
}

###

variable "vm" {
  description = "Virtual machine details"
  type = object({
    id = string
    name = string
    tags = list(string)
    node_name = string
    on_boot = bool
    started = bool
    stop_on_destroy = bool
  })
  default = {
    id = "101"
    name = "ubuntu"
    tags = ["terraform"]
    node_name = "pve"
    on_boot = false
    started = false
    stop_on_destroy = true
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
