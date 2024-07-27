resource "spacelift_context_attachment" "debug" {
  context_id = "debug"
  stack_id   = "vault"
  priority   = 0
}

resource "spacelift_context_attachment" "provider_proxmox_ip" {
  context_id = "provider_proxmox_ip"
  stack_id   = "proxmox"
  priority   = 0
}
