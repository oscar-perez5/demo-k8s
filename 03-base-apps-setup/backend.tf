terraform {
  backend "remote" {
    organization = "oscar-demo"

    workspaces {
      name = "base-apps-staging-us-central"
    }
  }
}
