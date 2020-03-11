provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "worker" {
  count = 5
  name  = "sample_worker"
  image = "${docker_image.worker.latest}"
}

resource "docker_image" "worker" {
  name = "worker_image:latest"
}