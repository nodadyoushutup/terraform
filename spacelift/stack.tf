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