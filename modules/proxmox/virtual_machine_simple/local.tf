# modules/proxmox/virtual_machine_simple/local.tf

locals {
  virtual_machine = can(yamldecode(file("/mnt/workspace/virtual_machine.yaml")))
}