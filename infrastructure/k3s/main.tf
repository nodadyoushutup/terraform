# infrastructure/k3s/main.tf

module "k3s-master-1" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 200
  name = "k3s-master-1"
  description = "k3s-master-1 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-master",]
  disk = {
    size = 10
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 2048
  }
  cpu = {
    cores = 2
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.200/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

module "k3s-master-2" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 201
  name = "k3s-master-2"
  description = "k3s-master-2 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-master",]
  disk = {
    size = 10
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 2048
  }
  cpu = {
    cores = 2
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.201/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

module "k3s-master-3" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 202
  name = "k3s-master-3"
  description = "k3s-master-3 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-master",]
  disk = {
    size = 10
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 2048
  }
  cpu = {
    cores = 2
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.202/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

module "k3s-worker-1" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 203
  name = "k3s-worker-1"
  description = "k3s-worker-1 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-worker",]
  disk = {
    size = 400
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 16384
  }
  cpu = {
    cores = 4
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.203/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

module "k3s-worker-2" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 204
  name = "k3s-worker-2"
  description = "k3s-worker-2 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-worker",]
  disk = {
    size = 400
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 16384
  }
  cpu = {
    cores = 4
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.204/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

module "k3s-worker-3" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 205
  name = "k3s-worker-3"
  description = "k3s-worker-3 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-worker",]
  disk = {
    size = 400
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 16384
  }
  cpu = {
    cores = 4
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.205/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

module "k3s-worker-4" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine_simple/proxmox"
  # version = "1.0.0"
  vm_id = 206
  name = "k3s-worker-4"
  description = "k3s-worker-4 services"
  tags = ["terraform", "ubuntu", "k3s", "k3s-worker",]
  disk = {
    size = 400
    datastore_id = "k3s"
  }
  memory = {
    dedicated = 16384
  }
  cpu = {
    cores = 4
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.206/24"
        gateway = "192.168.1.1"
      }
    }
  }
}