# vault/output.tf

output "provider_endpoint_value" {
  value = local.provider
  description = "Provider credentials"
}

