terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.regiao_aws
}

# --- Variáveis Globais (definidas em terraform.tfvars) ---
locals {
  nome_ambiente_unico = "${var.nome_equipe}-${var.ambiente}"

  tags_comuns = {
    Equipe     = var.nome_equipe
    Ambiente   = var.ambiente
    Gerenciado = "Terraform"
  }
}

# --- 1. MÓDULO DE REDE (A BASE) ---
module "rede" {
  source = "../../modules/networking-stack"

  nome_ambiente = local.nome_ambiente_unico
  cidr_vpc      = "10.10.0.0/16"
  azs           = ["${var.regiao_aws}a", "${var.regiao_aws}b", "${var.regiao_aws}c"]
  tags_comuns   = local.tags_comuns
}

# --- 2. MÓDULO DO ECR (DOCKER) ---
module "ecr" {
  source = "../../modules/registry-ecr-stack"

  nomes_repositorios = ["frontend", "backend-login", "backend-pagamentos"]
  tags_comuns        = local.tags_comuns
}

# --- 3. MÓDULO DE BANCO DE DADOS (RDS) ---
module "banco_de_dados" {
  source = "../../modules/database-rds-stack"

  name_db           = "${local.nome_ambiente_unico}-db"
  db_instance_class = "db.t3.micro"
  db_username       = var.db_username
  db_password       = var.db_password


  vpc_id          = module.rede.vpc_id
  ids_subnets_db  = module.rede.ids_subnets_privadas
  id_sg_acesso_db = module.rede.id_sg_default

  tag_comuns = local.tags_comuns
}

# --- 4. MÓDULO DO CLUSTER (EKS) ---
module "eks" {
  source = "../../modules/cluster-eks-stack"

  nome_cluster      = local.nome_ambiente_unico
  varsao_kubernetes = "1.27"


  vpc_id      = module.rede.vpc_id
  ids_subnets = module.rede.ids_subnets_privadas

  tag_comuns = local.tags_comuns

  depends_on = [module.rede]
}

# --- 5. MÓDULO DE MONITORAMENTO ---
module "observability" {
  source = "../../modules/observability-stack"

  criar_stack_monitoramento = true

  nome_equipe = var.nome_equipe
  ambiente    = var.ambiente

  vpc_id     = module.rede.vpc_id
  subnet_ids = module.rede.ids_subnets_privadas

  depends_on = [module.rede]
}
