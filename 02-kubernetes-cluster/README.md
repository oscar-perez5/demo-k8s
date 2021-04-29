## kubernetes-staging-us-central
#### Assign proper roles to Terraform service account - https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest#configure-a-service-account
#### Define the following environment variable in Terraform Cloud
- GOOGLE_CREDENTIALS (Service account JSON file without spaces and marking it as sensitive)

#### Define the following Terraform variables in Terraform Cloud
- network_project_id (Network project ID)
- region (Desired network region)
- service_project_id (Service project ID)
#### Ref. https://cloud.google.com/vpc/docs/shared-vpc#shared_vpc_host_project_and_service_project_associations
