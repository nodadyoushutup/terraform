# spacelift/stack.tf

resource "spacelift_stack" "spacelift_attachment" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Spacelift attachments"
  name              = "spacelift_attachment"
  project_root      = "/infrastructure/spacelift/attachment"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "spacelift_attachment"]
}

resource "spacelift_stack" "proxmox" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Provisions Proxmox resources"
  name              = "proxmox"
  project_root      = "/infrastructure/proxmox"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "proxmox", "pve"]
}

resource "spacelift_stack" "vault" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Provisions HashiCorp Vault infrastructure."
  name              = "vault"
  project_root      = "/infrastructure/vault"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "virtual_machine", "vault"]
}

resource "spacelift_stack" "database" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Database infrastructure."
  name              = "database"
  project_root      = "/infrastructure/database"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "virtual_machine", "database"]
}

# resource "spacelift_stack" "k8s" {
#   administrative    = true
#   autodeploy        = true
#   branch            = "main"
#   description       = "Provisions a Kubernetes cluster"
#   name              = "k3s"
#   project_root      = "k3s"
#   repository        = "terraform"
#   terraform_version = "1.5.7"
# }