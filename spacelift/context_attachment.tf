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

resource "spacelift_context_attachment" "provider_proxmox_ip_proxmox" {
  context_id = "provider_proxmox_ip"
  stack_id   = "proxmox"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_proxmox_ip_vault" {
  context_id = "provider_proxmox_ip"
  stack_id   = "vault"
  priority   = 0
}
