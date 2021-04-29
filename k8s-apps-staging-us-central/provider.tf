data "google_client_config" "default" {}

data "terraform_remote_state" "kubernetes" {
  backend = "remote"

  config = {
    organization = "oscar-demo"
    workspaces = {
      name = "kubernetes-staging-us-central"
    }
  }
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.kubernetes.outputs.k8s_host
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = data.terraform_remote_state.kubernetes.outputs.cluster_ca_certificate
  }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.kubernetes.outputs.k8s_host
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = data.terraform_remote_state.kubernetes.outputs.cluster_ca_certificate
}
