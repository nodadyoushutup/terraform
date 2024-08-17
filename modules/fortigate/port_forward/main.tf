module "vip_truenas" {
  source  = "spacelift.io/nodadyoushutup/vip/fortigate"
  # version = "1.0.0"
  mappedport = var.mappedport
  fosid = var.extport
  name = var.name
  extport = var.extport
  mappedip = {
    range = var.mappedip.range
  }
}

module "firewall_policy_truenas" {
  source  = "spacelift.io/nodadyoushutup/policy/fortigate"
  # version = "1.0.0"
  name               = var.name
  policyid           = var.extport
  dstaddr = {
    name = var.dstaddr.name
  }
}
