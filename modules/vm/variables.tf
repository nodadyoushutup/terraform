# proxmox/variables.tf

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
  default     = false
}

variable "address" {
  description = "PVE Node IP Address"
  type        = string
  default     = false
}

# VM Config

variable "name" {
  description = "Virtual machine name"
  type        = string
  default     = "ubuntu"
}

variable "tags" {
  description = "An example list variable"
  type        = list(string)
  default     = ["terraform"]
}