# vault/vm.tf

resource "proxmox_virtual_environment_vm" "vault" {
  vm_id     = 101
  name      = "vault"
  tags      = ["terraform", "vault"]
  node_name = "pve"
  bios = "seabios"
  on_boot = false
  started = false
  stop_on_destroy = true
  agent {
    enabled = false
  }
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.101/24"
        gateway = "192.168.0.1"
      }
    }
    user_account {
      keys     = [
        file("/mnt/workspace/desktop.pub"),
        # trimspace(data.local_file.ssh_public_key_desktop.content)
      ]
      password = var.password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
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

