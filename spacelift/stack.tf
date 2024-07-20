# spacelift/stack.tf

resource "spacelift_stack" "proxmox" {
  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "Provisions Proxmox resources"
  name              = "proxmox"
  project_root      = "proxmox"
  repository        = "terraform"
  terraform_version = "1.5.7"
}

resource "spacelift_stack" "vault" {
  administrative    = true
  autodeploy        = false
  branch            = "main"
  description       = "Provisions HashiCorp Vault resources"
  name              = "vault"
  project_root      = "vault"
  repository        = "terraform"
  terraform_version = "1.5.7"
}

# resource "spacelift_stack_dependency" "vault_depends_on_proxmox" {
#   stack_id            = spacelift_stack.vault.id
#   depends_on_stack_id = spacelift_stack.proxmox.id
# }


# resource "spacelift_stack" "k8s-cluster" {
#   administrative    = true
#   autodeploy        = true
#   branch            = "main"
#   description       = "Provisions a Kubernetes cluster"
#   name              = "k3s"
#   project_root      = "k3s"
#   repository        = "terraform"
#   terraform_version = "1.5.7"
# }