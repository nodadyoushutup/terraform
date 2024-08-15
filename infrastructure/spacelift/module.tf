resource "spacelift_module" "virtual_machine" {
  name               = "virtual_machine"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/proxmox/virtual_machine"
}