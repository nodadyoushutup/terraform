resource "proxmox_virtual_environment_vm" "k3s_admin" {
  vm_id     = 102
  name      = "k3s-admin"
  tags      = ["terraform"]
  node_name = var.node_name
  bios = "seabios"
  on_boot = true
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.102/24"
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
    datastore_id = var.datastore_id.lvm
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
    size         = 20
    ssd = true
  }
  network_device {
    bridge = "vmbr0"
    model = "e1000e"
  }
  memory {
    dedicated = 4096
  }
  cpu {
    cores = 2
    sockets = 1
    type = "host"
    numa = true
  }
}

