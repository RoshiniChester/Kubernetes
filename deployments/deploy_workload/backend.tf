terraform {
  backend "gcs" {
    bucket  = "state-new"
    prefix  = "terraform/workloads"
  }
}