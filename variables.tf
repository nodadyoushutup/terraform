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

variable "init_password" {
  type = string
  description = "Password"
}

variable "ssh_keys" {
  type = object({
    ansible  = string
    github  = string
    desktop  = string
    terraform  = string
    init = string
  })
  description = "SSH key locations"

  default = {
    ansible  = ".ssh/ansible.pub"
    github  = ".ssh/github.pub"
    desktop  = ".ssh/desktop.pub"
    terraform  = ".ssh/terraform.pub"
    init  = ".ssh/init.pub"
  }
}
