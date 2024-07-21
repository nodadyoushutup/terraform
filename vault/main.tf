# vault/main.tf

# module "vault" {
#   source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
#   version = "0.1.8"

#   # Provider Config
#   username = var.username
#   endpoint = var.endpoint
#   address = var.address
#   insecure = var.insecure
#   api_token = var.api_token

#   # VM Config
#   vm_id = 101
#   name = "vault"
#   tags = ["terraform", "init", "vault"]
#   ipv4_address = "192.168.1.101/24"
#   user_account_keys = [
#     file("/mnt/workspace/desktop.pub"),
#     file("/mnt/workspace/proxmox.pub"),
#   ]
#   user_account_password = var.user_account_password
# }

module "virtual_machine" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  version = "0.1.8"

  # Required inputs 
  address      = var.address
  api_token    = var.api_token
  endpoint     = var.endpoint
  ipv4_address = "192.168.1.101"
  username     = var.username
  vm_id        = "101"

  # Optional inputs 
  # agent_enabled         = bool
  # bios                  = string
  # cpu_cores             = number
  # cpu_numa              = bool
  # cpu_sockets           = number
  # cpu_type              = string
  # disk_datastore_id     = string
  # disk_discard          = string
  # disk_file_id          = string
  # disk_interface        = string
  # disk_size             = number
  # disk_ssd              = bool
  # insecure              = bool
  # ipv4_gateway          = string
  # memory_dedicated      = number
  # name                  = string
  # network_bridge        = string
  # network_model         = string
  # node_name             = string
  # on_boot               = bool
  # password              = string
  # started               = bool
  # stop_on_destroy       = bool
  # tags                  = list(string)
  # user_account_keys     = list(string)
  # user_account_password = string
  # user_account_username = string
}