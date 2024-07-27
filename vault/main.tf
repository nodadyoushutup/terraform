# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.2.1"

  vm = {
    id = "101"
    name = "vault-server"
    tags = ["vault", "terraform"]
    node_name = "pve"
    bios = "seabios"
    on_boot = true
    started = true
    stop_on_destroy = true
  }

  agent = {
    enabled = true
  }

  network = {
    ipv4_address = "192.168.1.101/24"
    ipv4_gateway = "192.168.1.1"
    bridge = "vmbr0"
    model = "e1000e"
  }

  user_account = {
    username = local.virtual_machine.username
    password = local.virtual_machine.password
    keys = []
  }

  disk = {
    datastore_id = "local-lvm"
    file_id = "local:iso/vault-server-cloudimg-amd64.img"
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
