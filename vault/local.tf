# vault/local.tf

locals {
  provider_proxmox = yamldecode(file("/mnt/workspace/provider_proxmox.yaml"))
}