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

resource "spacelift_context" "ssh" {
  description = "SSH Keys"
  name        = "ssh"
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
  stack_id   = "npm"
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
