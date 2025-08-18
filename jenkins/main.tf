resource "jenkins_job" "cloud_image" {
  name     = "cloud-image"
  template = templatefile("${path.module}/job.xml", {
    description = "An cloud_image job created from Terraform"
  })
}