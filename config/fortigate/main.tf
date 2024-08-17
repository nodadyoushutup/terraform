# config/firtugate/main.tf

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

module "port_forward_vault" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 80
  extport = 101
  name = "vault"
  mappedip = {
    range = "192.168.1.101"
  }
  dstaddr = {
    name = "vault"
  }  
}