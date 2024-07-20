resource "spacelift_module" "vm" {
  name               = "vm"
  terraform_provider = "bgp/proxmox"
  administrative     = false
  branch             = "master"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/vm"
}