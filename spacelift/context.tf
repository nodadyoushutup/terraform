resource "spacelift_context" "debug" {
  description = "DEBUG level logs"
  name        = "debug"
}

resource "spacelift_context" "provider" {
  description = "Provider credentials"
  name        = "provider"
}