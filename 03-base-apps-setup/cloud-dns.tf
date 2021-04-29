module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "10.3.2"

  project_id = var.service_project_id
  activate_apis = [
    "dns.googleapis.com",
  ]

  disable_services_on_destroy = false
  disable_dependent_services  = false
}

module "cloud_dns_public_zone" {
  source     = "terraform-google-modules/cloud-dns/google"
  version    = "3.1.0"
  project_id = var.service_project_id
  type       = "public"
  name       = "demo"
  domain     = var.domain

  depends_on = [
    module.project_services
  ]
}
