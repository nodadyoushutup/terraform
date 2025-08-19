resource "jenkins_job" "cloud_image" {
  name     = "cloud-image"
  template = templatefile("${path.module}/job/cloud_image.xml", {
    description = "A cloud_image job created with Packer"
  })
}

resource "jenkins_job" "proxmox" {
  name     = "proxmox"
  template = templatefile("${path.module}/job/terraform.xml", {
    description = "Proxmox assets"
  })
}