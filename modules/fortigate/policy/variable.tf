variable "action" {
  type    = string
  default = "accept"
}

variable "logtraffic" {
  type    = string
  default = "all"
}

variable "name" {
  type    = string
}

variable "policyid" {
  type    = number
}

variable "schedule" {
  type    = string
  default = "always"
}

variable "wanopt" {
  type    = string
  default = "disable"
}

variable "wanopt_detection" {
  type    = string
  default = "off"
}

variable "wanopt_passive_opt" {
  type    = string
  default = "default"
}

variable "wccp" {
  type    = string
  default = "disable"
}

variable "webcache" {
  type    = string
  default = "disable"
}

variable "webcache_https" {
  type    = string
  default = "disable"
}

variable "wsso" {
  type    = string
  default = "disable"
}

variable "dstaddr_name" {
  type    = string
}

variable "dstintf_name" {
  type    = string
  default = "lan"
}

variable "service_name" {
  type    = string
  default = "ALL"
}

variable "srcaddr_name" {
  type    = string
  default = "all"
}

variable "srcintf_name" {
  type    = string
  default = "wan"
}
