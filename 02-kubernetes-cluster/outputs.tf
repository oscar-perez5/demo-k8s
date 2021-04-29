output "cluster_ca_certificate" {
  value     = base64decode(module.gke.ca_certificate)
  sensitive = true
}

output "k8s_host" {
  value     = module.gke.endpoint
  sensitive = true
}
