# vault/output.tf

output "provider_endpoint_value" {
  value = local.provider.proxmox
  description = "Test"
}

