resource "spacelift_environment_variable" "debug" {
  context_id = "debug"
  name       = "TF_LOG"
  value      = "DEBUG"
  write_only = false
}