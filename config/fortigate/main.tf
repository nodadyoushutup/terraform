# config/fortigate/main.tf

module "port_forward_truenas_gui" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 80
  extport = 10080
  name = "truenas_gui"
  mappedip = {
    range = "192.168.1.100"
  }
  dstaddr = {
    name = "truenas_gui"
  }  
}

module "port_forward_truenas_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 10022
  name = "truenas_ssh"
  mappedip = {
    range = "192.168.1.100"
  }
  dstaddr = {
    name = "truenas_ssh"
  }  
}

module "port_forward_vault_gui" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 80
  extport = 10180
  name = "vault_gui"
  mappedip = {
    range = "192.168.1.101"
  }
  dstaddr = {
    name = "vault_gui"
  }  
}

module "port_forward_vault_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 80
  extport = 10122
  name = "vault_ssh"
  mappedip = {
    range = "192.168.1.101"
  }
  dstaddr = {
    name = "vault_ssh"
  }  
}

module "port_forward_database_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 10322
  name = "database_ssh"
  mappedip = {
    range = "192.168.1.103"
  }
  dstaddr = {
    name = "database_ssh"
  }  
}

module "port_forward_database_postgresql" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 5432
  extport = 5432
  name = "database_postgresql"
  mappedip = {
    range = "192.168.1.103"
  }
  dstaddr = {
    name = "database_postgresql"
  }  
}

module "port_forward_database_mysql" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 3306
  extport = 3306
  name = "database_mysql"
  mappedip = {
    range = "192.168.1.103"
  }
  dstaddr = {
    name = "database_mysql"
  }  
}