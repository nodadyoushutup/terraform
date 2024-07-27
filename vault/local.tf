# vault/local.tf

locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
}