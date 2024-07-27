# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.2.2"

  vm = {
    id = "101"
    name = "vault"
    tags = ["terraform", "vault"]
    node_name = "pve"
    bios = "seabios"
    on_boot = false
    started = false
    stop_on_destroy = true
  }

  agent = {
    enabled = false
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.1.101/24"
        gateway = "192.168.1.1"
      }
      user_account {
        username = local.virtual_machine.username
        password = local.virtual_machine.password
        keys = []
      }
    }
  }

  disk = {
    datastore_id = "local-lvm"
    file_id = "local:iso/jammy-server-cloudimg-amd64.img"
    interface = "scsi0"
    discard = "on"
    size = 50
    ssd = true
  }

  memory = {
    dedicated = 8192
  }

  cpu = {
    cores = 4
    sockets = 1
    type = "host"
    numa = true
  }
}
