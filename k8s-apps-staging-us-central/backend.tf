terraform {
  backend "remote" {
    organization = "oscar-demo"

    workspaces {
      name = "k8s-apps-staging-us-central"
    }
  }
}
