terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}
provider "aws" { region = var.regiao_aws }

locals {
  nome_unico = "${var.nome_projeto}-${var.ambiente}"
  tags_comuns = {
    Projeto  = var.nome_projeto
    Ambiente = var.ambiente
  }
}

# 1. Rede
module "rede" {
  source        = "../../modules/networking-stack"
  nome_ambiente = local.nome_unico
  azs           = ["${var.regiao_aws}a", "${var.regiao_aws}b"]
  tags_comuns   = local.tags_comuns
}

# 2. ECR (Para a imagem Docker)
module "ecr" {
  source             = "../../modules/registry-ecr-stack"
  nomes_repositorios = [var.nome_projeto] # Cria o repo "portfolio-blazor"
  tags_comuns        = local.tags_comuns
}

# 3. EKS (Para rodar o app)
module "eks" {
  source            = "../../modules/cluster-eks-stack"
  nome_cluster      = local.nome_unico
  varsao_kubernetes = "1.29"
  vpc_id            = module.rede.vpc_id
  ids_subnets       = module.rede.ids_subnets_privadas
  tag_comuns        = local.tags_comuns
}

# 4. Observability (Para monitorar)
module "observability" {
  source                    = "../../modules/observability-stack"
  criar_stack_monitoramento = true
  nome_equipe               = var.nome_projeto
  ambiente                  = var.ambiente
  vpc_id                    = module.rede.vpc_id
  subnet_ids                = module.rede.ids_subnets_privadas
}
