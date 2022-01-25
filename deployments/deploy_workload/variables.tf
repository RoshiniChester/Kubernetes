variable "cluster" {
  default = "deploy-service-cluster"
}
variable "app" {
  type        = string
  description = "Name of application"
  default     = "hello-world"
}
variable "region" {
  default = "us-central1"
}
variable "docker-image" {
  type        = string
  description = "name of the docker image to deploy"
  default     = "us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0"
}