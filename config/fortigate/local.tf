# config/fortiugate/local.tf

locals {
  provider = try(yamldecode(file("/mnt/workspace/provider.yaml")), {})
}