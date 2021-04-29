## Create, manage and deploy Kubernetes workloads using Terraform
### Description
This project uses Google Cloud, Terraform and Helm to automate the creation of a WordPress Blog with SSL enabled.

Change Terraform Organization with: `find . -name "*.tf" -exec sed -i "s/oscar-demo/YOUR_ORGANIZATION/g" '{}' \;`

### Folder structure
```
├── 01-networking
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   └── variables.tf
├── 02-kubernetes-cluster
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   └── variables.tf
├── 03-base-apps-setup
│   ├── backend.tf
│   ├── cert-manager.tf
│   ├── charts
│   │   └── clusterissuers
│   │       ├── Chart.yaml
│   │       ├── templates
│   │       │   ├── clusterissuers.yaml
│   │       │   ├── _helpers.tpl
│   │       │   └── NOTES.txt
│   │       └── values.yaml
│   ├── cloud-dns.tf
│   ├── external-dns.tf
│   ├── nginx.tf
│   ├── nginx-values.yaml
│   ├── openebs.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   └── variables.tf
├── 04-wordpress
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   ├── variables.tf
│   └── wordpress-values.yaml
└── README.md
```
