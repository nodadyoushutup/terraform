# modules/proxmox/virtual_machine/local.tf

locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
  cpu_flags_regex = [
    "^[-+](",
    "aes|",
    "amd-no-ssb",
    ")"
  ]
}