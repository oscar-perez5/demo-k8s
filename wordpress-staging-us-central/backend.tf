terraform {
  backend "remote" {
    organization = "oscar-demo"

    workspaces {
      name = "wordpress-staging-us-central"
    }
  }
}
