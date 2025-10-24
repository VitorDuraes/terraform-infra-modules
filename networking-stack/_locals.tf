locals {
  nome_ambiente = var.nome_ambiente

  cidrs_subnets_publicas = [
    for k, v in var.azs : cidrsubnet(var.cidr_vpc, 8, k)
  ]
  cidrs_subnets_privadas = [
    for k, v in var.azs : cidrsubnet(var.cidr_vpc, 8, k + length(var.azs))
  ]

  tags = merge(
    var.tags_comuns,
    {
      ManegedBy = "Terraform"
      Module    = "networking-stack"
    }
  )
}
