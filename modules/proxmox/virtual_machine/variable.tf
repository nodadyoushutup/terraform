# modules/proxmox/virtual_machine/variable.tf

variable "acpi" {
  description = "(Optional) Whether to enable ACPI (defaults to true)."
  type = bool
  default = true
}

variable "agent" {
  description = "(Optional) The QEMU agent configuration."
  type = object({
    enabled = optional(bool, false)
    timeout = optional(string, "15m")
    trim = optional(bool, false)
    type = optional(string, "virtio")
  })
  default = null
  validation {
    condition = var.agent == null || can(regex("^\\d+m$", var.agent.timeout))
    error_message = "Invalid timeout format. The timeout should be a number followed by 'm' (e.g., '15m')."
  }
  validation {
    condition = var.agent == null || contains(["isa", "virtio"], var.agent.type)
    error_message = "Invalid instance type. Valid options are ['isa', 'virtio']"
  }
}

variable "audio_device" {
  description = "(Optional) An audio device."
  type = object({
    device  = optional(string, "intel-hda")
    driver  = optional(string, "spice")
    enabled = optional(bool, true)
  })
  default = null
  validation {
    condition = var.audio_device == null || contains(["AC97", "ich9-intel-hda", "intel-hda"], var.audio_device.device)
    error_message = "Invalid device type. Valid options are ['AC97', 'ich9-intel-hda', 'intel-hda']"
  }
  validation {
    condition = var.audio_device == null || contains(["spice"], var.audio_device.driver)
    error_message = "Invalid driver type. Valid options are ['spice']"
  }
}

variable "bios" {
  description = "(Optional) The BIOS implementation (defaults to seabios)."
  type = string
  default = "seabios"
  validation {
    condition = var.bios == null || contains(["ovmf", "seabios"], var.bios)
    error_message = "Inalid instance type. Valid options are ['ovmf', 'seabios']"
  }
}

variable "boot_order" {
  description = "(Optional) Specify a list of devices to boot from in the order they appear in the list (defaults to [])."
  type = list(string)
  default = []
  validation {
    condition = var.boot_order == [] || alltrue([for device in var.boot_order : can(regex("^(scsi|ide|virtio|sata|net)\\d+$", device))])
    error_message = "Each entry in boot_order must match the pattern 'scsiN', 'ideN', 'virtioN', 'sataN', or 'netN' where N is a number."
  }
}

variable "cdrom" {
  description = "(Optional) The CDROM configuration."
  type = object({
    enabled = optional(bool, false)
    file_id = optional(string, "cdrom")
    interface = optional(string, "ide3")
  })
  default = null
  validation {
    condition = var.cdrom == null || can(regex("^(cdrom|[^:]+:iso/[^\\s]+)$", var.cdrom.file_id))
    error_message = "The file_id must be 'cdrom' or in the format 'volume:iso/path/to/file'."
  }
  validation {
    condition = var.cdrom == null || can(regex("^ide\\d+$", var.cdrom.interface))
    error_message = "The interface must be in the form ideN where N is a number."
  }
}

variable "clone" {
  description = "(Optional) The cloning configuration."
  type = object({
    datastore_id = optional(string, "local-lvm")
    node_name = optional(string, "pve")
    retries = optional(number, 5)
    vm_id = optional(number, 999)
    full = optional(bool, true)
  })
  default = null
  validation {
    condition = var.clone == null || can((var.clone.vm_id >= 100 && var.clone.vm_id <= 999999999))
    error_message = "The vm_id must be between 100 and 999999999."
  }
}

variable "cpu" {
  description = "(Optional) The CPU configuration."
  type = object({
    architecture = optional(string, "x86_64")
    cores = optional(number, 1)
    flags = optional(list(string), [])
    hotplugged = optional(number, 0)
    limit = optional(number, 0)
    numa = optional(bool, false)
    sockets = optional(number, 1)
    type = optional(string, "host")
    units = optional(number, 1024)
    affinity = optional(string, null)
  })
  default = null
  validation {
    condition = var.cpu == null || contains(["aarch64", "x86_64"], var.cpu.architecture)
    error_message = "Inalid instance type. Valid options are ['aarch64', 'x86_64']"
  }
  validation {
    condition = var.cpu == null || alltrue([
      for flag in var.cpu.flags :
        can(
          regex(
            join("", [
              "^[-+](",
              "aes|",
              "amd-no-ssb|",
              "amd-ssbd|",
              "hv-evmcs|",
              "hv-tlbflush|",
              "ibpb|",
              "md-clear|",
              "pcid|",
              "pdpe1gb|",
              "spec-ctrl|",
              "ssbd|",
              "virt-ssbd|",
              ")$"
            ]), 
            flag
          )
        )
    ])
    error_message = join("", [
      "Each flag must start with + or - and be one of the allowed values: ",
      "['+aes', '-aes', '+amd-no-ssb', '-amd-no-ssb', '+amd-ssbd', '-amd-ssbd', ",
      "'+hv-evmcs', '-hv-evmcs', '+hv-tlbflush', '-hv-tlbflush', '+ibpb', '-ibpb', ",
      "'+md-clear', '-md-clear', '+pcid', '-pcid', '+pdpe1gb', '-pdpe1gb', ",
      "'+spec-ctrl', '-spec-ctrl', '+ssbd', '-ssbd', '+virt-ssbd', '-virt-ssbd']."
    ])
  }
  validation {
    condition = var.cpu == null || can(
      regex(
        join("", [
          "^(",
          "486|",
          "Broadwell|Broadwell-IBRS|Broadwell-noTSX|Broadwell-noTSX-IBRS|",
          "Cascadelake-Server|Cascadelake-Server-noTSX|Cascadelake-Server-v2|Cascadelake-Server-v4|Cascadelake-Server-v5|",
          "Conroe|",
          "Cooperlake|Cooperlake-v2|",
          "EPYC|EPYC-IBPB|EPYC-Milan|EPYC-Rome|EPYC-Rome-v2|EPYC-v3|",
          "Haswell|Haswell-IBRS|Haswell-noTSX|Haswell-noTSX-IBRS|",
          "Icelake-Client|Icelake-Client-noTSX|",
          "Icelake-Server|Icelake-Server-noTSX|Icelake-Server-v3|Icelake-Server-v4|Icelake-Server-v5|Icelake-Server-v6|",
          "IvyBridge|IvyBridge-IBRS|",
          "KnightsMill|",
          "Nehalem|Nehalem-IBRS|",
          "Opteron_G1|Opteron_G2|Opteron_G3|Opteron_G4|Opteron_G5|",
          "Penryn|",
          "SandyBridge|SandyBridge-IBRS|",
          "SapphireRapids|",
          "Skylake-Client|Skylake-Client-IBRS|Skylake-Client-noTSX-IBRS|Skylake-Client-v4|",
          "Skylake-Server|Skylake-Server-IBRS|Skylake-Server-noTSX-IBRS|Skylake-Server-v4|Skylake-Server-v5|",
          "Westmere|Westmere-IBRS|",
          "athlon|",
          "core2duo|coreduo|",
          "host|",
          "kvm32|kvm64|",
          "max|",
          "pentium|pentium2|pentium3|",
          "phenom|",
          "qemu32|qemu64|",
          "x86-64-v2|x86-64-v2-AES|x86-64-v3|x86-64-v4|",
          "custom-[A-Za-z0-9@#$%^&*()-_=+]+",
          ")$"
        ]), 
        var.cpu.type
      )
    )
    error_message = join("", [
      "CPU type must be one of the following: ",
      "['486', ",
      "'Broadwell', 'Broadwell-IBRS', 'Broadwell-noTSX', 'Broadwell-noTSX-IBRS', ",
      "'Cascadelake-Server', 'Cascadelake-Server-noTSX', 'Cascadelake-Server-v2', ",
      "'Cascadelake-Server-v4', 'Cascadelake-Server-v5', 'Conroe', ",
      "'Cooperlake', 'Cooperlake-v2', ",
      "'EPYC', 'EPYC-IBPB', 'EPYC-Milan', 'EPYC-Rome', 'EPYC-Rome-v2', ", "EPYC-v3, ",
      "'Haswell', 'Haswell-IBRS', 'Haswell-noTSX', 'Haswell-noTSX-IBRS', ",
      "'Icelake-Client', 'Icelake-Client-noTSX', ", 
      "'Icelake-Server', 'Icelake-Server-noTSX', 'Icelake-Server-v3', 'Icelake-Server-v4', ",
      "'Icelake-Server-v5',' Icelake-Server-v6', ", 
      "'IvyBridge',' IvyBridge-IBRS', ",
      "'KnightsMill', ",
      "'Nehalem', 'Nehalem-IBRS', ",
      "'Opteron_G1', 'Opteron_G2', 'Opteron_G3', 'Opteron_G4', 'Opteron_G5', ",
      "'Penryn', ",
      "'SandyBridge', ", "'SandyBridge-IBRS', ",
      "'SapphireRapids', ",
      "'Skylake-Client', 'Skylake-Client-IBRS', 'Skylake-Client-noTSX-IBRS', 'Skylake-Client-v4', ",
      "'Skylake-Server', 'Skylake-Server-IBRS', 'Skylake-Server-noTSX-IBRS', 'Skylake-Server-v4', ",
      "'Skylake-Server-v5', ",
      "'Westmere', 'Westmere-IBRS', ",
      "'athlon', ",
      "'core2duo', 'coreduo', ",
      "'host', ",
      "'kvm32', 'kvm64', ",
      "'max', ",
      "'pentium', 'pentium2', 'pentium3', ",
      "'phenom', ",
      "'qemu32', 'qemu64', ",
      "'x86-64-v2', 'x86-64-v2-AES', 'x86-64-v3', 'x86-64-v4', ",
      "'or custom- followed by alphanumeric characters and symbols']."
    ])
  }
  validation {
    condition = var.cpu == null || var.cpu.affinity == null || can(regex("^\\d+(,\\d+)*$|^\\d+-\\d+$", var.cpu.affinity))
    error_message = "Affinity must be a string of comma separated numbers, or two numbers separated by a hyphen."
  }
}

variable "description" {
  description = "(Optional) Virtual machine description."
  type = string
  default = "Virtual machine"
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
    ip_config = optional(object({
      ipv4 = optional(object({
        address = optional(string, "dhcp")
        gateway = optional(string, null)
      }), null)
    }), null)
    user_account = optional(object({
      keys = optional(list(string), [])
      password = optional(string, "ubuntu")
      username = optional(string, "ubuntu")
    }), null)
  })
  default = null
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
