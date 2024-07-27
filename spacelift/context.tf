resource "spacelift_context" "debug" {
  description = "DEBUG level logs"
  name        = "debug"
}

resource "spacelift_context" "provider_proxmox_ip" {
  description = "Proxmox provider credentials"
  name        = "provider-proxmox-ip"
}