# terraform-infra-modules

Repositório de infraestrutura como código (IaC) utilizando **Terraform** para provisionar e gerenciar recursos na **AWS**.  
O objetivo é construir uma **infraestrutura modular e reutilizável**, onde cada stack representa um conjunto de recursos independentes (rede, EKS, banco, monitoramento, etc).

---

## 📁 Estrutura do Projeto

infra-modules/
│
├── networking/            # Rede: VPC, subnets, NAT Gateway
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── subnets.tf
│   └── nat_gateway.tf
│
├── eks-cluster/           # Cluster EKS e Nodegroups
│   ├── variables.tf
│   ├── outputs.tf
│   ├── eks_cluster.tf
│   ├── eks_nodegroups.tf
│   └── iam_roles.tf
│
├── ecr-registry/          # Repositório ECR
│   ├── variables.tf
│   ├── outputs.tf
│   └── ecr.tf
│
├── rds-database/          # Banco de dados RDS
│   ├── variables.tf
│   ├── outputs.tf
│   └── rds.tf
│
└── observability/         # Monitoramento e visualização
    ├── variables.tf
    ├── outputs.tf
    ├── grafana.tf
    ├── prometheus.tf
    └── efs.tf

---

## ⚙️ Pré-requisitos

- **Terraform** ≥ 1.5  
- **AWS CLI** configurada (`aws configure`)  
- Conta AWS com permissões administrativas  
- (Opcional) **S3 + DynamoDB** para backend remoto do estado

---

## 🚀 Como usar

### 1️⃣ Clonar o repositório
```bash
git clone https://github.com/seu-usuario/terraform-aws-infra.git
cd terraform-aws-infra
```

### 2️⃣ Inicializar o Terraform
```terraform init ```

### 3️⃣ Validar a configuração
```terraform validate ```

### 4️⃣ Visualizar o plano
```terraform plan ```

### 5️⃣ Aplicar a infraestrutura
```terraform apply ```
