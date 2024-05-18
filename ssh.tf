data "local_file" "ssh_public_key_desktop" {
  filename = var.ssh_keys.desktop
}

data "local_file" "ssh_public_key_init" {
  filename = var.ssh_keys.init
}