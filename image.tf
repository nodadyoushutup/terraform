resource "proxmox_virtual_environment_download_file" "ubuntu_bionic_18_04_cloud_image" {
  content_type = "iso"
  datastore_id = var.datastore_id.local
  node_name    = var.node_name
  url = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_focal_20_04_cloud_image" {
  content_type = "iso"
  datastore_id = var.datastore_id.local
  node_name    = var.node_name
  url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_jammy_22_04_cloud_image" {
  content_type = "iso"
  datastore_id = var.datastore_id.local
  node_name    = var.node_name
  url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_noble_22_04_cloud_image" {
  content_type = "iso"
  datastore_id = var.datastore_id.local
  node_name    = var.node_name
  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}