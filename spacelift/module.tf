resource "spacelift_module" "vm" {
  name               = "vm"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "master"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/vm"
}