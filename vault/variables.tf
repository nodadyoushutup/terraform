# Provider Config
variable "endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "username" {
  description = "Proxmox API username"
  type        = string
}

variable "password" {
  description = "Proxmox API password"
  type        = string
  sensitive   = true
}

variable "insecure" {
  description = "Allow insecure API connections"
  type        = bool
  default     = false
}

variable "api_token" {
  description = "Proxmox API token"
  type        = string
}

variable "address" {
  description = "PVE Node IP Address"
  type        = string
}
