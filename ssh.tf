data "local_file" "ssh_public_key_terraform" {
  filename = var.ssh_keys.terraform
}

data "local_file" "ssh_public_key_ansible" {
  filename = var.ssh_keys.ansible
}

data "local_file" "ssh_public_key_github" {
  filename = var.ssh_keys.github
}

data "local_file" "ssh_public_key_desktop" {
  filename = var.ssh_keys.desktop
}

data "local_file" "ssh_public_key_init" {
  filename = var.ssh_keys.init
}