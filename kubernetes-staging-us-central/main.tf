data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "oscar-demo"
    workspaces = {
      name = "networking-staging-us-central"
    }
  }
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "14.2.0"

  project_id               = var.service_project_id
  network_project_id       = var.network_project_id
  name                     = "demo-gke"
  regional                 = true
  region                   = var.region
  remove_default_node_pool = true
  network                  = data.terraform_remote_state.vpc.outputs.network_name
  subnetwork               = data.terraform_remote_state.vpc.outputs.subnet_name
  ip_range_pods            = data.terraform_remote_state.vpc.outputs.subnet_ip_range_pods
  ip_range_services        = data.terraform_remote_state.vpc.outputs.subnet_ip_range_services
  enable_private_nodes     = true
  create_service_account   = true
  http_load_balancing      = false
  release_channel          = "REGULAR"

  node_pools = [
    {
      name         = "demo-node-pool"
      image_type   = "UBUNTU_CONTAINERD"
      machine_type = "n1-standard-2"
      min_count    = 1
      max_count    = 1
    },
  ]
}
