module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = var.network_project_id
  network_name = "demo-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.162.0.0/20"
      subnet_region         = var.region
      subnet_private_access = "true"
    },
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "subnet-01-pods"
        ip_cidr_range = "10.168.0.0/14"
      },
      {
        range_name    = "subnet-01-services"
        ip_cidr_range = "10.180.0.0/20"
      },
    ]
  }
}

module "nat" {
  source        = "terraform-google-modules/cloud-nat/google"
  version       = "~> 1.2"
  project_id    = var.network_project_id
  region        = var.region
  network       = module.vpc.network_name
  create_router = true
  router        = "demo-router"
}
