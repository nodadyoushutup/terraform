resource "spacelift_module" "vm" {
  name               = "vm"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/vm"
}