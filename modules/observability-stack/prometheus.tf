resource "aws_prometheus_workspace" "this" {
  count = local.count

  alias = "${local.prefixo_recurso}-prometheus"

  tags = local.tags_comuns
}
