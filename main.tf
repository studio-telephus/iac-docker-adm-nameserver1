locals {
  docker_image_name = "tel-adm-nameserver"
  container_name    = "container-adm-nameserver1"
}

resource "docker_image" "nameserver" {
  name         = local.docker_image_name
  keep_locally = false
  build {
    context = path.module
    build_args = {
      RANDOM_STRING = "30b02873-69b7-4e99-b14d-6d4b8493cfa0"
    }
  }
}

module "container_adm_nameserver1" {
  source = "github.com/studio-telephus/terraform-docker-container.git?ref=1.0.3"
  name   = local.container_name
  image  = docker_image.nameserver.image_id
  networks_advanced = [
    {
      name         = "adm-docker"
      ipv4_address = "10.10.0.101"
    }
  ]
  environment = {
    RANDOM_STRING = "d21bf651-549f-494e-aed8-dd40089b4c37"
  }
  command = ["supervisord"]
}
