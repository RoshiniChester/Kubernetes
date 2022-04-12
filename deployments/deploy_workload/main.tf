provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "google_container_registry" "registry" {
  project  = "proj-rosh"
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = var.app
    labels = {
      app = var.app
    }
  }
  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {
        container {
          image = var.docker-image
          name  = var.app
          port {
            name           = "port-8080"
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = var.app
  }
  spec {
    selector = {
      app = kubernetes_deployment.app.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
} 