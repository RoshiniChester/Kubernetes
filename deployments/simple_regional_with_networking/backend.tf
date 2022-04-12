terraform {
  backend "gcs" {
    bucket  = "state-new"
    prefix  = "terraform/k8"
  }
}