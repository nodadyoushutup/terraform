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

module "port_forward_monitoring_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 10222
  name = "monitoring_ssh"
  mappedip = {
    range = "192.168.1.102"
  }
  dstaddr = {
    name = "monitoring_ssh"
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

module "port_forward_npm_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 10422
  name = "npm_ssh"
  mappedip = {
    range = "192.168.1.104"
  }
  dstaddr = {
    name = "npm_ssh"
  }  
}

module "port_forward_development_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 10522
  name = "development_ssh"
  mappedip = {
    range = "192.168.1.105"
  }
  dstaddr = {
    name = "development_ssh"
  }  
}

module "port_forward_k3s_master_1_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20022
  name = "k3s_master_1_ssh"
  mappedip = {
    range = "192.168.1.200"
  }
  dstaddr = {
    name = "k3s_master_1_ssh"
  }  
}

module "port_forward_k3s_master_2_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20122
  name = "k3s_master_2_ssh"
  mappedip = {
    range = "192.168.1.201"
  }
  dstaddr = {
    name = "k3s_master_2_ssh"
  }  
}

module "port_forward_k3s_master_3_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20222
  name = "k3s_master_3_ssh"
  mappedip = {
    range = "192.168.1.202"
  }
  dstaddr = {
    name = "k3s_master_3_ssh"
  }  
}

module "port_forward_k3s_worker_1_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20322
  name = "k3s_worker_1_ssh"
  mappedip = {
    range = "192.168.1.203"
  }
  dstaddr = {
    name = "k3s_worker_1_ssh"
  }  
}

module "port_forward_k3s_worker_2_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20422
  name = "k3s_worker_2_ssh"
  mappedip = {
    range = "192.168.1.204"
  }
  dstaddr = {
    name = "k3s_worker_2_ssh"
  }  
}

module "port_forward_k3s_worker_3_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20522
  name = "k3s_worker_3_ssh"
  mappedip = {
    range = "192.168.1.205"
  }
  dstaddr = {
    name = "k3s_worker_3_ssh"
  }  
}

module "port_forward_k3s_worker_4_ssh" {
  source  = "spacelift.io/nodadyoushutup/port_forward/fortigate"
  # version = "1.0.0"
  mappedport = 22
  extport = 20622
  name = "k3s_worker_4_ssh"
  mappedip = {
    range = "192.168.1.206"
  }
  dstaddr = {
    name = "k3s_worker_4_ssh"
  }  
}