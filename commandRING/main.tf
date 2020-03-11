provider "docker" {
  host = "ssh://jenkins@127.0.0.1:22"
}

resource "docker_container" "worker" {
  name  = "sample_worker"
  image = "docker_image.worker.latest"
}

resource "docker_image" "worker" {
  name = "worker_image:latest"
}