# modules/proxmox/virtual_machine/local.tf

locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
  flags_regex = [
    "^[-+](",
    "aes|",
    "amd-no-ssb",
    ")"
  ]
}