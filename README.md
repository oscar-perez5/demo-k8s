## Create, manage and deploy Kubernetes workloads using Terraform
### Description
This project uses Google Cloud, Terraform and Helm to automate the creation of a WordPress Blog with SSL enabled.

### Change Terraform Organization with: `find . -name "*.tf" -exec sed -i "s/oscar-demo/YOUR_ORGANIZATION/g" '{}' \;`

### Folder structure
```
├── k8s-apps-staging-us-central
│   ├── backend.tf
│   ├── cert-manager.tf
│   ├── charts
│   │   └── clusterissuers
│   │       ├── charts
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
├── kubernetes-staging-us-central
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   └── variables.tf
├── networking-staging-us-central
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   └── variables.tf
├── README.md
└── wordpress-staging-us-central
    ├── backend.tf
    ├── main.tf
    ├── outputs.tf
    ├── provider.tf
    ├── README.md
    ├── variables.tf
    └── wordpress-values.yaml
```
