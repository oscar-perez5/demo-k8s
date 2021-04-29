resource "helm_release" "nginx" {
  name             = "nginx"
  namespace        = "nginx"
  create_namespace = true
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "nginx-ingress-controller"
  version          = "7.6.1"

  values = [
    file("nginx-values.yaml")
  ]

  set {
    name  = "kind"
    value = "DaemonSet"
  }

  set {
    name  = "service.externalTrafficPolicy"
    value = "Local"
  }
}
