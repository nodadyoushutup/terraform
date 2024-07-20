resource "proxmox_virtual_environment_vm" "k3s_master_1" {
  vm_id     = 201
  name      = "k3s-master-1"
  tags      = ["terraform", "k3s", "k3s_master"]
  node_name = var.node_name
  bios = "seabios"
  on_boot = true
  stop_on_destroy = true
  agent {
    enabled = false
  }
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.201/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      keys     = [
        trimspace(data.local_file.ssh_public_key_init.content),
        trimspace(data.local_file.ssh_public_key_desktop.content)
      ]
      password = var.password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = var.datastore_id.k3s
    file_id      = proxmox_virtual_environment_download_file.ubuntu_jammy_22_04_cloud_image.id
    interface    = "scsi0"
    discard      = "on"
    size         = 10
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

