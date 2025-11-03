resource "aws_grafana_workspace" "this" {
  count = local.count

  name                     = "${local.prefixo_recurso}-grafana"
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["AWS_SSO"]
  permission_type          = "SERVICE_MANAGED"
  role_arn                 = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/AWSGrafanaServiceRole-..." # ATENÇÃO: Você precisa criar essa Role!

  vpc_configuration {
    security_group_ids = [aws_security_group.grafana[0].id]
    subnet_ids         = var.subnet_ids
  }

  tags = local.tags_comuns

}

resource "aws_security_group" "grafana" {
  count = local.count

  name        = "${local.prefixo_recurso}-grafana-sg"
  description = "SG para o workspace Grafana"
  vpc_id      = var.vpc_id


  tags = local.tags_comuns
}

data "aws_caller_identity" "current" {}
