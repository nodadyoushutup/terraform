# vault/output.tf

output "provider_endpoint_value" {
  value = local.provider_proxmox
  description = "Test"
}

