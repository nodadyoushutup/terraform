resource "spacelift_module" "virtual_machine" {
  name               = "virtual_machine"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/proxmox/virtual_machine"
}

resource "spacelift_module" "virtual_machine_simple" {
  name               = "virtual_machine_simple"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine (Simple)"
  repository         = "terraform"
  project_root       = "modules/proxmox/virtual_machine_simple"
}