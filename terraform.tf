resource "proxmox_virtual_environment_vm" "terraform" {
  vm_id     = 101
  name      = "terraform"
  tags      = ["controller", "terraform"]
  node_name = "pve"
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.101/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      username = "init"
      password = var.init_password
      keys     = [
        trimspace(data.local_file.ssh_public_key_terraform.content),
        trimspace(data.local_file.ssh_public_key_ansible.content),
        trimspace(data.local_file.ssh_public_key_github.content),
        trimspace(data.local_file.ssh_public_key_desktop.content),
        trimspace(data.local_file.ssh_public_key_init.content),
      ]
    }
  }
  disk {
    datastore_id = var.datastore_id.lvm
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }
  network_device {
    bridge = "vmbr0"
  }
  memory {
    dedicated = 1024
  }
  cpu {
    cores = 1
    sockets = 1
  }
}

