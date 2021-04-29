locals {
  cluster_issuer_name = "letsencrypt-production"
}
resource "helm_release" "cert-manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.3.1"

  set {
    name  = "installCRDs"
    value = true
  }
}

resource "helm_release" "clusterissuers" {
  name    = local.cluster_issuer_name
  chart   = "./charts/clusterissuers"
  version = "0.1.0"

  set {
    name  = "nameOverride"
    value = local.cluster_issuer_name
  }

  set {
    name  = "production.enabled"
    value = "true"
  }

  depends_on = [
    helm_release.cert-manager
  ]
}
