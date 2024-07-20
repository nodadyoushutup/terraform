# resource "spacelift_stack_dependency" "vault_depends_on_proxmox" {
#   stack_id            = spacelift_stack.vault.id
#   depends_on_stack_id = spacelift_stack.proxmox.id
# }