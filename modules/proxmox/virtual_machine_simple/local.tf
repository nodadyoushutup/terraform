# modules/proxmox/virtual_machine/local.tf

locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
}