# config/firtugate/main.tf

module "vip_truenas" {
  source  = "spacelift.io/nodadyoushutup/vip/fortigate"
  # version = "1.0.0"
}

resource "fortios_firewall_policy" "policy_truenas" {
  action             = "accept"
  logtraffic         = "all"
  name               = "truenas"
  policyid           = 100
  schedule           = "always"
  wanopt             = "disable"
  wanopt_detection   = "off"
  wanopt_passive_opt = "default"
  wccp               = "disable"
  webcache           = "disable"
  webcache_https     = "disable"
  wsso               = "disable"
  dstaddr {
    name = "truenas"
  }
  dstintf {
    name = "lan"
  }
  service {
    name = "ALL"
  }
  srcaddr {
    name = "all"
  }
  srcintf {
    name = "wan"
  }
}