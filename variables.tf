variable "provider_config" {
  type = object({
    endpoint  = string
    username  = string
    password  = string
    insecure  = bool
  })
  description = "Configuration settings for the provider"

  default = {
    endpoint  = "https://default-endpoint:8006/"
    username  = "default-user@pam"
    password  = "default-password"
    insecure  = false
  }
}

variable "node_name" {
  type = string
  description = "Proxmox node name"
  default = "pve"
}

variable "datastore_id" {
  type = object({
    local  = string
    lvm  = string
  })
  description = "Proxmox datastore IDs"

  default = {
    local  = "local"
    lvm  = "local-lvm"
  }
}

variable "vault_password" {
  type = string
  description = "Password for the vault user"
}