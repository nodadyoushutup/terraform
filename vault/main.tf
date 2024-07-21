# vault/main.tf

module "vault" {
  source  = "spacelift.io/nodadyoushutup/vm/proxmox"
  version = "0.0.6"

  # Provider Config
  username = var.username
  password = var.password
  endpoint = var.endpoint
  address = var.address
  insecure = var.insecure
  api_token = var.api_token

  # VM Config
  vm_id = 101
  name = "vault"
  tags = ["terraform", "vault"]
  node_name = "pve"
  bios = "seabios"
  on_boot = false
  started = false
  stop_on_destroy = true
  agent_enabled = false

  ipv4_address = "192.168.1.101/24"
  ipv4_gateway = "192.168.1.1"

  user_account_keys = [
    file("/mnt/workspace/desktop.pub"),
    file("/mnt/workspace/proxmox.pub"),
  ]
  user_account_password = var.password
  user_account_username = "ubuntu"
  
  disk_datastore_id = "local-lvm"
  disk_file_id = "local:iso/jammy-server-cloudimg-amd64.img"
  disk_interface = "scsi0"
  disk_discard = "on"
  disk_size = 50
  disk_ssd = true
  
  network_bridge = "vmbr0"
  network_model = "e1000e"
  
  memory_dedicated = 4096
  
  cpu_cores = 2
  cpu_sockets = 1
  cpu_type = "host"
  cpu_numa = true
}