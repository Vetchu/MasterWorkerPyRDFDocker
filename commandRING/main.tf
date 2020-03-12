provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "worker" {
  count = 5
  name  = "${format("sample_worker-%d", count.index)}"
  image = "${docker_image.worker.latest}"
  start = "true"
}

resource "docker_image" "worker" {
  name = "worker_image:latest"
}

resource "random_string" "random" {
  length = 16
  special = true
  override_special = "/@£$"
}