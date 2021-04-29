data "terraform_remote_state" "k8s_apps" {
  backend = "remote"

  config = {
    organization = "oscar-demo"
    workspaces = {
      name = "k8s-apps-staging-us-central"
    }
  }
}

resource "random_password" "wordpress" {
  length           = 24
  special          = true
  override_special = "!@%&()-_=+[]<>:?"
}

resource "random_password" "mariadb" {
  length           = 24
  special          = true
  override_special = "!@%&()-_=+[]<>:?"
}

resource "helm_release" "wordpress" {
  name             = "wordpress"
  namespace        = "wordpress"
  create_namespace = true
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "wordpress"
  version          = "10.10.8"

  values = [
    file("wordpress-values.yaml")
  ]

  set_sensitive {
    name  = "wordpressPassword"
    value = random_password.wordpress.result
  }

  set_sensitive {
    name  = "mariadb.auth.password"
    value = random_password.mariadb.result
  }

  set_sensitive {
    name  = "mariadb.auth.rootPassword"
    value = random_password.mariadb.result
  }

  set {
    name  = "ingress.hostname"
    value = var.hostname
  }

  set {
    name  = "ingress.annotations.cert-manager\\.io/cluster-issuer"
    value = data.terraform_remote_state.k8s_apps.outputs.cluster_issuer_name
  }
}
