locals {
  count = var.criar_stack_monitoramento ? 1 : 0

  prefixo_recurso = "${var.nome_equipe}-${var.ambiente}"

  tags_comuns = {
    Equipe     = var.nome_equipe
    Ambiente   = var.ambiente
    Gerenciado = "Terraform"
    Modulo     = "monitoramento-stack"
  }
}
