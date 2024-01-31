data "docker_image" "debian_bookworm" {
  name = "debian:bookworm"
}

module "container_adm_nameserver1" {
  source = "github.com/studio-telephus/terraform-docker-container.git?ref=1.0.1"
  name   = "container-adm-nameserver1"
  image  = data.docker_image.debian_bookworm.id
  networks_advanced = [
    {
      name         = "adm-docker"
      ipv4_address = "10.10.0.101"
    }
  ]
  upload_dirs = [
    "${path.module}/filesystem",
    "${path.module}/filesystem-shared-ca-certificates"
  ]
  exec_enabled = true
  exec         = "/mnt/install.sh"
  environment = {
    RANDOM_STRING = "30b02873-69b7-4e99-b14d-6d4b8493cfa0"
  }
  command = ["supervisord"]
}
