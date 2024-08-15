# vault/main.tf

resource "proxmox_virtual_environment_vm" "vault" {
  name        = "vault"
  description = "HashiCorp Vault"
  tags        = ["terraform", "ubuntu"]
  node_name = "pve"
  vm_id     = 101
  stop_on_destroy = true
  agent {
    enabled = false
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
    interface    = "scsi0"
    size         = 10
  }
  initialization {
    ip_config {
      ipv4 = {
        address = "192.168.1.101/24"
        gateway = "192.168.1.1"
      }
    }
    user_account = {
      username = local.virtual_machine.username
      password = local.virtual_machine.password
      keys = [file("/mnt/workspace/work.pub")]
    }
  }
}

