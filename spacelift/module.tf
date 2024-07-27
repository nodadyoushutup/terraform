resource "spacelift_module" "virtual_machine" {
  name               = "virtual_machine"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/virtual_machine"
}

resource "spacelift_module" "provider_proxmox" {
  name               = "provider_proxmox"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Proxmox provider"
  repository         = "terraform"
  project_root       = "modules/provider_proxmox"
}