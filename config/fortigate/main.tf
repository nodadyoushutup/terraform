# config/firtugate/main.tf

# module "vip_truenas" {
#   source  = "spacelift.io/nodadyoushutup/vip/fortigate"
#   # version = "1.0.0"
#   mappedport = 80
#   fosid = 100
#   name = "truenas"
#   extport = 100
#   mappedip = {
#     range = "192.168.1.100"
#   } 
# }

# module "firewall_policy_truenas" {
#   source  = "spacelift.io/nodadyoushutup/policy/fortigate"
#   # version = "1.0.0"
#   name               = "truenas"
#   policyid           = 100
#   dstaddr_name       = "truenas"
# }

module "port_forward_truenas" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 80
  extport = 100
  name = "truenas"
  mappedip = {
    range = "192.168.1.100"
  }
  dstaddr = {
    name = "truenas"
  }  
}