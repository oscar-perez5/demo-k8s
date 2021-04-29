module "cloud_dns_public_zone" {
  source     = "terraform-google-modules/cloud-dns/google"
  version    = "3.1.0"
  project_id = var.service_project_id
  type       = "public"
  name       = "demo"
  domain     = var.domain
}
