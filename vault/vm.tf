# vault/vm.tf

resource "proxmox_virtual_environment_vm" "vault" {
  vm_id     = 101
  name      = "vault"
  tags      = ["terraform", "vault"]
  node_name = "pve"
  bios = "seabios"
  on_boot = true
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
      # keys     = [
      #   trimspace(data.local_file.ssh_public_key_init.content),
      #   trimspace(data.local_file.ssh_public_key_desktop.content)
      # ]
      password = var.password
      username = "ubuntu"
    }
  }
  disk {
    datastore_id = "k3s"
    file_id      = "local:iso/ubuntu-jammy-22.04-cloudimg-amd64.img"
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

