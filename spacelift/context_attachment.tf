resource "spacelift_context_attachment" "debug" {
  context_id = "debug"
  stack_id   = "vault"
  priority   = 0
}
