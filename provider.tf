terraform {
  required_providers {
    jenkins = {
      source  = "taiidani/jenkins"
      version = ">= 0.10.2"
    }
  }
}

provider "jenkins" {
  server_url = "http://192.168.1.101:8080"
  username = "admin"
  password = var.password
}

