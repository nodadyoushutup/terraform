# spacelift/stack.tf

resource "spacelift_stack" "k8s-cluster" {
  administrative    = true
  autodeploy        = true
  branch            = "master"
  description       = "Provisions a Kubernetes cluster"
  name              = "Kubernetes Cluster Stack"
  project_root      = "spacelift"
  repository        = "terraform"
  terraform_version = "1.9.2"
}