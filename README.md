# terraform-infra-modules

```bash
├── networking/           # Rede: VPC, subnets, NAT Gateway
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── subnets.tf
│   └── nat_gateway.tf
│
├── eks-cluster/          # Cluster EKS e Nodegroups
│   ├── variables.tf
│   ├── outputs.tf
│   ├── eks_cluster.tf
│   ├── eks_nodegroups.tf
│   └── iam_roles.tf
│
├── ecr-registry/         # Repositório ECR
│   ├── variables.tf
│   ├── outputs.tf
│   └── ecr.tf
│
├── rds-database/         # Banco de dados RDS
│   ├── variables.tf
│   ├── outputs.tf
│   └── rds.tf
│
└── observability/        # Monitoramento e visualização
    ├── variables.tf
    ├── outputs.tf
    ├── grafana.tf
    ├── prometheus.tf
    └── efs.tf

```
