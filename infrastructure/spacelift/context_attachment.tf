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
