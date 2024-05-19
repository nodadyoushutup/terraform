resource "proxmox_virtual_environment_vm" "k3s_worker_1" {
  vm_id     = 204
  name      = "k3s-worker-1"
  tags      = ["terraform", "k3s", "k3s_worker"]
  node_name = var.node_name
  bios = "seabios"
  on_boot = true
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.204/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      keys     = [
        trimspace(data.local_file.ssh_public_key_init.content),
        trimspace(data.local_file.ssh_public_key_desktop.content)
      ]
      password = var.init_password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = var.datastore_id.k3s
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "scsi0"
    discard      = "on"
    size         = 200
    ssd = true
  }
  network_device {
    bridge = "vmbr0"
    model = "e1000e"
  }
  memory {
    dedicated = 16384
  }
  cpu {
    cores = 2
    sockets = 1
    type = "host"
    numa = true
  }
}

resource "proxmox_virtual_environment_vm" "k3s_worker_2" {
  vm_id     = 205
  name      = "k3s-worker-2"
  tags      = ["terraform", "k3s", "k3s_worker"]
  node_name = var.node_name
  bios = "seabios"
  on_boot = true
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.205/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      keys     = [
        trimspace(data.local_file.ssh_public_key_init.content),
        trimspace(data.local_file.ssh_public_key_desktop.content)
      ]
      password = var.init_password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = var.datastore_id.k3s
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "scsi0"
    discard      = "on"
    size         = 200
    ssd = true
  }
  network_device {
    bridge = "vmbr0"
    model = "e1000e"
  }
  memory {
    dedicated = 16384
  }
  cpu {
    cores = 2
    sockets = 1
    type = "host"
    numa = true
  }
}

resource "proxmox_virtual_environment_vm" "k3s_worker_3" {
  vm_id     = 206
  name      = "k3s-worker-3"
  tags      = ["terraform", "k3s", "k3s_worker"]
  node_name = var.node_name
  bios = "seabios"
  on_boot = true
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.206/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      keys     = [
        trimspace(data.local_file.ssh_public_key_init.content),
        trimspace(data.local_file.ssh_public_key_desktop.content)
      ]
      password = var.init_password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = var.datastore_id.k3s
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "scsi0"
    discard      = "on"
    size         = 200
    ssd = true
  }
  network_device {
    bridge = "vmbr0"
    model = "e1000e"
  }
  memory {
    dedicated = 16384
  }
  cpu {
    cores = 2
    sockets = 1
    type = "host"
    numa = true
  }
}

resource "proxmox_virtual_environment_vm" "k3s_worker_4" {
  vm_id     = 207
  name      = "k3s-worker-4"
  tags      = ["terraform", "k3s", "k3s_worker"]
  node_name = var.node_name
  bios = "seabios"
  on_boot = true
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.207/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      keys     = [
        trimspace(data.local_file.ssh_public_key_init.content),
        trimspace(data.local_file.ssh_public_key_desktop.content)
      ]
      password = var.init_password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = var.datastore_id.k3s
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "scsi0"
    discard      = "on"
    size         = 200
    ssd = true
  }
  network_device {
    bridge = "vmbr0"
    model = "e1000e"
  }
  memory {
    dedicated = 16384
  }
  cpu {
    cores = 2
    sockets = 1
    type = "host"
    numa = true
  }
}
