output "network_name" {
  value = module.vpc.network_name
}

output "subnet_ip_range_pods" {
  value = module.vpc.subnets_secondary_ranges[0][0].range_name
}

output "subnet_ip_range_services" {
  value = module.vpc.subnets_secondary_ranges[0][1].range_name
}

output "subnet_name" {
  value = module.vpc.subnets_names[0]
}
