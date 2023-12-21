module "container_adm_nameserver1" {
  source    = "github.com/studio-telephus/tel-iac-modules-lxd.git//container?ref=develop"
  name      = "container-adm-nameserver1"
  image     = "images:debian/buster"
  profiles  = ["limits", "fs-dir", "nw-adm"]
  autostart = true
  nic = {
    name = "eth0"
    properties = {
      nictype        = "bridged"
      parent         = "adm-network"
      "ipv4.address" = "10.0.10.101"
    }
  }
  mount_dirs = [
    "${path.cwd}/filesystem-shared-ca-certificates",
    "${path.cwd}/filesystem",
  ]
  exec_enabled = true
  exec         = "/mnt/install.sh"
  environment = {
    RANDOM_STRING = "30b02873-69b7-4e99-b14d-6d4b8493cfa0"
  }
}
