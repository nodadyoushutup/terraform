# vault/main.tf

module "example" {
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
  vm_id = 800
  name = "ubuntu"
  tags = ["terraform"]
  # node_name = "pve" # optional
  # bios = "seabios" # optional
  # on_boot = false # optional
  # started = false # optional
  # stop_on_destroy = true # optional
  # agent_enabled = false # optional

  ipv4_address = "192.168.1.101/24"
  # ipv4_gateway = "192.168.1.1" # optional

  user_account_keys = [
    file("/mnt/workspace/desktop.pub"),
    file("/mnt/workspace/proxmox.pub"),
  ]
  user_account_password = var.password
  # user_account_username = "ubuntu" # optional
  
  # disk_datastore_id = "local-lvm" # optional
  # disk_file_id = "local:iso/jammy-server-cloudimg-amd64.img" # optional
  # disk_interface = "scsi0" # optional
  # disk_discard = "on" # optional
  # disk_size = 50 # optional
  # disk_ssd = true # optional
  
  # network_bridge = "vmbr0" # optional
  # network_model = "e1000e" # optional
  
  # memory_dedicated = 4096 # optional
  
  # cpu_cores = 2 # optional
  # cpu_sockets = 1 # optional
  # cpu_type = "host" # optional
#   cpu_numa = true # optional
}