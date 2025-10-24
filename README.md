# terraform-infra-modules

Repositório de infraestrutura como código (IaC) utilizando **Terraform** para provisionar e gerenciar recursos na **AWS**. O objetivo é construir uma **infraestrutura modular e reutilizável**, onde cada stack representa um conjunto de recursos independentes (rede, EKS, banco, monitoramento, etc).

```bash
├── infra-modules/
│   ├── networking/
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── vpc.tf
│   │   └── subnets.tf
│   │
│   ├── eks-cluster/
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── eks_cluster.tf
│   │   ├── eks_nodegroups.tf
│   │   └── iam_roles.tf
│   │
│   ├── ecr-registry/
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── ecr.tf
│   │
│   ├── rds-database/
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── rds.tf
│   │
│   └── observability/
│       ├── variables.tf
│       ├── outputs.tf
│       ├── grafana.tf
│       ├── prometheus.tf
│       └── efs.tf
```

Este repositório contém os seguintes módulos:

networking: Cria a fundação da rede (VPC, Subnets Públicas e Privadas, NAT Gateway).

eks-cluster: Provisiona um cluster EKS (Elastic Kubernetes Service) com NodeGroups.

ecr-registry: Cria repositórios no ECR (Elastic Container Registry) para imagens Docker.

rds-database: Provisiona um banco de dados gerenciado (RDS).

observability: Configura o stack de monitoramento (Prometheus, Grafana) e um EFS para persistência.

📋 Pré-requisitos
Antes de começar, você vai precisar de:

Terraform (v1.x ou superior)

Uma conta AWS

AWS CLI configurado com suas credenciais (aws configure)

kubectl (para interagir com o cluster EKS)

🚀 Como Executar
Este repositório é uma coleção de módulos. Para usá-los, você deve criar um projeto raiz (em outro diretório ou repositório) que irá consumir estes módulos.

Crie os arquivos do seu projeto raiz: Crie uma pasta e adicione os arquivos main.tf, variables.tf, etc.

Exemplo de main.tf (projeto raiz): Este arquivo irá chamar os módulos deste repositório.

Terraform

# Configura o provider AWS

terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 5.0"
}
}
}

provider "aws" {
region = var.aws_region
}

# 1. Módulo de Rede

module "networking" {
source = "git::https://github.com/seu-usuario/terraform-infra-modules.git//infra-modules/networking"

# (ou use o caminho local, ex: "./terraform-infra-modules/infra-modules/networking")

vpc_cidr = var.vpc_cidr
aws_region = var.aws_region
project_name = var.project_name
}

# 2. Módulo do EKS

module "eks_cluster" {
source = "git::https://github.com/seu-usuario/terraform-infra-modules.git//infra-modules/eks-cluster"

cluster_name = var.cluster_name
vpc_id = module.networking.vpc_id
subnet_ids = module.networking.private_subnet_ids # EKS em sub-redes privadas
}

# ... e assim por diante para RDS, ECR, etc.

Inicialize o Terraform: No diretório do seu projeto raiz, execute:

Bash

terraform init
Planeje e Aplique:

Bash

terraform plan
terraform apply

👤 Autor
[Vitor Durães]
