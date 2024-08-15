# vault/main.tf

resource "proxmox_virtual_environment_vm" "vault" {
  vm_id = 101
  name = "vault"
  description = "HashiCorp Vault"
  tags = ["terraform", "ubuntu"]
  node_name = "pve"
  on_boot = false
  started = false
  stop_on_destroy = true
  boot_order = ["scsi0"]
  agent {
    enabled = false
  }
  disk {
    datastore_id = "local-lvm"
    file_id = "local:iso/jammy-server-cloudimg-amd64.img"
    interface = "scsi0"
    size = 10
  }
  memory {
    dedicated = 4096
  }
  cpu {
    sockets = 1
    cores = 2
  }
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.1.101/24"
        gateway = "192.168.1.1"
      }
    }
    user_account {
      username = local.virtual_machine.username
      password = local.virtual_machine.password
      keys = [file("/mnt/workspace/work.pub")]
    }
  }
}

