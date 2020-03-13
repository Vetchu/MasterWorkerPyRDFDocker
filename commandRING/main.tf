provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "worker" {
  count = 5
  name  = "${format("sample_worker-%d", count.index)}"
  image = "worker_image:latest"
  start = "true"
}

resource "random_string" "random" {
  length = 16
  special = true
  override_special = "/@£$"
}