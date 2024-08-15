# vault/local.tf

locals {
  virtual_machine = yamldecode(file("/mnt/workspace/virtual_machine.yaml"))
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
}