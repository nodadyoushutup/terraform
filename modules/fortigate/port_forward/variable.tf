# Define variables for VIP Module
variable "mappedport" {
  description = "Port number on the internal network that the service is running on"
  type        = number
  default     = 80
}

variable "fosid" {
  description = "Unique identifier for the FortiOS object"
  type        = number
  default     = 100
}

variable "name" {
  description = "Name of the VIP and the Firewall policy"
  type        = string
  default     = "truenas"
}

variable "extport" {
  description = "External port number to be used for accessing the service"
  type        = number
  default     = 100
}

variable "mappedip" {
  description = "Mapped IP address range for the VIP"
  type        = object({
    range = string
  })
}

# Define variables for Firewall Policy Module
variable "policyid" {
  description = "Policy ID for the firewall policy"
  type        = number
  default     = 100
}

variable "dstaddr" {
  description = "Destination address name for the firewall policy"
  type        = object({
    name = string
  })
}
