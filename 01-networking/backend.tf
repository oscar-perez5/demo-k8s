terraform {
  backend "remote" {
    organization = "oscar-demo"

    workspaces {
      name = "networking-staging-us-central"
    }
  }
}
