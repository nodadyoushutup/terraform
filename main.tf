resource "jenkins_job" "cloud_image" {
  name = "cloud-image"
  template = templatefile("${path.module}/job.xml", {
    description = "A cloud_image job created with Packer"
    project_url = "https://github.com/nodadyoushutup/cloud-image"
    scm_repository_url = "https://github.com/nodadyoushutup/cloud-image"
    script_path = "pipeline.jenkins"
  })
}

resource "jenkins_job" "terraform_proxmox" {
  name = "terraform-proxmox"
  template = templatefile("${path.module}/job.xml", {
    description = "Proxmox assets"
    project_url = "https://github.com/nodadyoushutup/terraform-proxmox"
    scm_repository_url = "https://github.com/nodadyoushutup/terraform-proxmox"
    script_path = "pipeline.jenkins"
  })
}