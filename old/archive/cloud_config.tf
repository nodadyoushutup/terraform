resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"

  source_raw {
    file_name = "cloud-config.yaml"
    # data = file("${path.module}/cloud_config.yaml")
    data = <<EOF
#cloud-config
chpasswd:
  list: |
    ubuntu:${var.init_password}
  expire: false
hostname: ubuntu
users:
  - default
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    ssh-authorized-keys:
      - ${trimspace(data.local_file.ssh_public_key_init.content)}
      - ${trimspace(data.local_file.ssh_public_key_desktop.content)}
    sudo: ALL=(ALL) NOPASSWD:ALL
runcmd:
    - apt update
    - apt install -y qemu-guest-agent net-tools
    - timedatectl set-timezone America/New_york
    - systemctl enable qemu-guest-agent
    - systemctl start qemu-guest-agent
    - echo "done" > /tmp/cloud-config.done
    EOF
  }
}