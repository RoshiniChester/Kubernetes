
locals {
  cluster_type = "deploy-service"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "gke" {
  source     = "../../modules/simple_regional_with_networking"
  project_id = var.project_id
  name       = "${local.cluster_type}-cluster${var.cluster_name_suffix}"
  region     = var.region
  network    = var.network
  subnetwork = var.subnetwork
  

  ip_range_pods          = var.ip_range_pods
  ip_range_services      = var.ip_range_services
  create_service_account = false
  service_account        = var.compute_engine_service_account
}

# provider "google" {
#   project = "focal-set-306013"
#   version = "~> 3.55.0"
#   region  = var.region
#   zone = var.zone
  
# }

# data "google_client_config" "default" {}

# locals {
#   cluster_ca_certificate = data.google_container_cluster.gke_cluster.master_auth != null ? data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate : ""
#   private_endpoint       = try(data.google_container_cluster.gke_cluster.private_cluster_config[0].private_endpoint, "")
#   default_endpoint       = data.google_container_cluster.gke_cluster.endpoint != null ? data.google_container_cluster.gke_cluster.endpoint : ""
#   endpoint               = var.use_private_endpoint == true ? local.private_endpoint : local.default_endpoint
#   host                   = local.endpoint != "" ? "https://${local.endpoint}" : ""
#   context                = data.google_container_cluster.gke_cluster.name != null ? data.google_container_cluster.gke_cluster.name : ""
# }

# data "google_container_cluster" "gke_cluster" {
#   name     = "my_cluster"
#   location = "us-central1-a"
# }

# data "google_client_config" "provider" {}
