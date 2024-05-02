data "local_file" "ssh_public_key_terraform" {
  filename = "/home/init/.ssh/terraform.pub"
}

data "local_file" "ssh_public_key_ansible" {
  filename = "/home/init/.ssh/ansible.pub"
}

data "local_file" "ssh_public_key_github" {
  filename = "/home/init/.ssh/github.pub"
}

data "local_file" "ssh_public_key_desktop" {
  filename = "/home/init/.ssh/desktop.pub"
}