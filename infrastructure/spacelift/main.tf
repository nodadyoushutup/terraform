# infrastructure/spacelift/main.tf

resource "spacelift_environment_variable" "debug" {
  context_id = "debug"
  name       = "TF_LOG"
  value      = "DEBUG"
  write_only = false
}

resource "spacelift_module" "virtual_machine" {
  name               = "virtual_machine"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine"
  repository         = "terraform"
  project_root       = "modules/proxmox/virtual_machine"
  labels             = ["infrastructure", "proxmox"]
}

resource "spacelift_module" "virtual_machine_simple" {
  name               = "virtual_machine_simple"
  terraform_provider = "proxmox"
  administrative     = false
  branch             = "main"
  description        = "Virtual Machine (Simple)"
  repository         = "terraform"
  project_root       = "modules/proxmox/virtual_machine_simple"
  labels             = ["infrastructure", "proxmox"]
}

resource "spacelift_module" "fortigate_vip" {
  name               = "vip"
  terraform_provider = "fortigate"
  administrative     = false
  branch             = "main"
  description        = "Fortigate Firewall Virtual IP"
  repository         = "terraform"
  project_root       = "modules/fortigate/vip"
  labels             = ["config", "fortigate"]
}

resource "spacelift_module" "fortigate_policy" {
  name               = "policy"
  terraform_provider = "fortigate"
  administrative     = false
  branch             = "main"
  description        = "Fortigate Firewall Policy"
  repository         = "terraform"
  project_root       = "modules/fortigate/policy"
  labels             = ["config", "fortigate"]
}

resource "spacelift_module" "fortigate_port_forward" {
  name               = "port_forward"
  terraform_provider = "fortigate"
  administrative     = false
  branch             = "main"
  description        = "Fortigate Port Forward"
  repository         = "terraform"
  project_root       = "modules/fortigate/port_forward"
  labels             = ["config", "fortigate"]
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

resource "spacelift_stack" "k3s" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "k3s infrastructure."
  name              = "k3s"
  project_root      = "/infrastructure/k3s"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["infrastructure", "virtual_machine", "k3s"]
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

resource "spacelift_stack" "fortigate" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Fortigate config."
  name              = "fortigate"
  project_root      = "/config/fortigate"
  repository        = "terraform"
  terraform_version = "1.5.7"
  labels            = ["config", "networking", "fortigate"]
}

resource "spacelift_stack" "all_init" {
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "All initialization."
  name              = "all_init"
  project_root      = "/init/all"
  repository        = "ansible"
  labels            = ["init", "all"]
  ansible {
    playbook = "main.yaml"
  }
}

resource "spacelift_context" "debug" {
  description = "DEBUG level logs"
  name        = "debug"
}

resource "spacelift_context" "provider" {
  description = "Provider credentials"
  name        = "provider"
}

resource "spacelift_context" "virtual_machine" {
  description = "Virtual machine credentials"
  name        = "virtual_machine"
}

resource "spacelift_context_attachment" "debug_vault" {
  context_id = "debug"
  stack_id   = "vault"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_spacelift" {
  context_id = "debug"
  stack_id   = "spacelift"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_proxmox" {
  context_id = "debug"
  stack_id   = "proxmox"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_database" {
  context_id = "debug"
  stack_id   = "database"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_monitoring" {
  context_id = "debug"
  stack_id   = "monitoring"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_npm" {
  context_id = "debug"
  stack_id   = "npm"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_development" {
  context_id = "debug"
  stack_id   = "development"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_k3s" {
  context_id = "debug"
  stack_id   = "k3s"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_fortigate" {
  context_id = "debug"
  stack_id   = "fortigate"
  priority   = 0
}

resource "spacelift_context_attachment" "debug_all_init" {
  context_id = "debug"
  stack_id   = "all_init"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_proxmox" {
  context_id = "provider"
  stack_id   = "proxmox"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_vault" {
  context_id = "provider"
  stack_id   = "vault"
  priority   = 0
}

resource "spacelift_context_attachment" "virtual_machine_vault" {
  context_id = "virtual_machine"
  stack_id   = "vault"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_database" {
  context_id = "provider"
  stack_id   = "database"
  priority   = 0
}

resource "spacelift_context_attachment" "virtual_machine_database" {
  context_id = "virtual_machine"
  stack_id   = "database"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_monitoring" {
  context_id = "provider"
  stack_id   = "monitoring"
  priority   = 0
}

resource "spacelift_context_attachment" "virtual_machine_monitoring" {
  context_id = "virtual_machine"
  stack_id   = "monitoring"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_npm" {
  context_id = "provider"
  stack_id   = "npm"
  priority   = 0
}

resource "spacelift_context_attachment" "virtual_machine_npm" {
  context_id = "virtual_machine"
  stack_id   = "npm"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_development" {
  context_id = "provider"
  stack_id   = "development"
  priority   = 0
}

resource "spacelift_context_attachment" "virtual_machine_development" {
  context_id = "virtual_machine"
  stack_id   = "development"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_k3s" {
  context_id = "provider"
  stack_id   = "k3s"
  priority   = 0
}

resource "spacelift_context_attachment" "virtual_machine_k3s" {
  context_id = "virtual_machine"
  stack_id   = "k3s"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_fortigate" {
  context_id = "provider"
  stack_id   = "fortigate"
  priority   = 0
}

resource "spacelift_context_attachment" "ansible_all_init" {
  context_id = "ansible"
  stack_id   = "all_init"
  priority   = 0
}



# resource "spacelift_stack_dependency" "vault_depends_on_proxmox" {
#   stack_id            = spacelift_stack.vault.id
#   depends_on_stack_id = spacelift_stack.proxmox.id
# }