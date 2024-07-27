# modules/proxmox/virtual_machine/variable.tf

variable "name" {
  description = "Virtual machine name"
  type        = string
  default     = "ubuntu"
}

variable "tags" {
  description = "An example list variable"
  type        = list(string)
  default     = ["terraform"]
}

variable "node_name" {
  description = "Node name"
  type        = string
  default     = "pve"
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "seabios"
}

variable "on_boot" {
  description = "Start VM on boot"
  type        = bool
  default     = false
}

variable "started" {
  description = "Start VM immediately after creation"
  type        = bool
  default     = false
}

variable "stop_on_destroy" {
  description = "Stop VM on destroy"
  type        = bool
  default     = true
}

variable "agent_enabled" {
  description = "Enable agent"
  type        = bool
  default     = false
}

variable "ipv4_address" {
  description = "IPv4 address"
  type        = string
}

variable "ipv4_gateway" {
  description = "IPv4 gateway"
  type        = string
  default     = "192.168.1.1"
}

variable "user_account_keys" {
  description = "User account keys"
  type        = list(string)
  default     = []
}

variable "user_account" {
  description = "User account details"
  type = object({
    username = string
    password = string
  })
  default = {
    username = "ubuntu"
    password = "ubuntu"
  }
}

variable "disk_datastore_id" {
  description = "Disk datastore ID"
  type        = string
  default     = "local-lvm"
}

variable "vm_id" {
  description = "VM ID"
  type        = string
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 50
}

variable "disk_file_id" {
  description = "Disk file ID"
  type        = string
  default     = "local:iso/jammy-server-cloudimg-amd64.img"
}

variable "disk_interface" {
  description = "Disk interface type"
  type        = string
  default     = "scsi0"
}

variable "disk_discard" {
  description = "Disk discard option"
  type        = string
  default     = "on"
}

variable "disk_ssd" {
  description = "Is the disk SSD?"
  type        = bool
  default     = true
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "network_model" {
  description = "Network model"
  type        = string
  default     = "e1000e"
}

variable "memory_dedicated" {
  description = "Dedicated memory in MB"
  type        = number
  default     = 4096
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "cpu_sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "host"
}

variable "cpu_numa" {
  description = "Enable NUMA"
  type        = bool
  default     = true
}