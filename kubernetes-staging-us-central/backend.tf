terraform {
  backend "remote" {
    organization = "oscar-demo"

    workspaces {
      name = "kubernetes-staging-us-central"
    }
  }
}
