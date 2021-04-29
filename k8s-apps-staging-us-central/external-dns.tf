resource "kubernetes_namespace" "external_dns" {
  metadata {
    name = "external-dns"
  }
}

resource "kubernetes_secret" "service_account" {
  metadata {
    name      = "gcp-service-account"
    namespace = kubernetes_namespace.external_dns.metadata[0].name
  }

  data = {
    "credentials.json" = var.service_account_secret
  }

  type = "Opaque"
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  namespace  = kubernetes_namespace.external_dns.metadata[0].name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"
  version    = "4.11.1"

  set {
    name  = "provider"
    value = "google"
  }

  set {
    name  = "google.project"
    value = var.service_project_id
  }

  set {
    name  = "google.serviceAccountSecret"
    value = kubernetes_secret.service_account.metadata[0].name
  }

  set {
    name  = "policy"
    value = "sync"
  }

  depends_on = [
    module.cloud_dns_public_zone
  ]
}
