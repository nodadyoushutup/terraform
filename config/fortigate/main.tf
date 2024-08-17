# config/firtugate/main.tf

resource "fortios_firewall_address" "trname" {
  allow_routing        = "disable"
  associated_interface = "wan"
  color                = 3
  end_ip               = "255.255.255.0"
  name                 = "testaddress"
  start_ip             = "22.1.1.0"
  subnet               = "22.1.1.0 255.255.255.0"
  type                 = "ipmask"
  visibility           = "enable"
}