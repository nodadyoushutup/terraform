# spacelift/stack.tf

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

resource "spacelift_stack" "monitoring" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Monitoring infrastructure."
  name              = "monitoring"
  project_root      = "/infrastructure/monitoring"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "virtual_machine", "monitoring"]
}

resource "spacelift_stack" "npm" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "npm infrastructure."
  name              = "npm"
  project_root      = "/infrastructure/npm"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "virtual_machine", "npm"]
}

resource "spacelift_stack" "development" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Development infrastructure."
  name              = "development"
  project_root      = "/infrastructure/development"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "virtual_machine", "development"]
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