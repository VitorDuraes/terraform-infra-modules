variable "criar_stack_monitoramento" {
  description = "Se true, cria toda a stack de monitoramento."
  type        = bool
  default     = false
}

variable "nome_equipe" {
  description = "Nome da equipe dona (para tags e nomes)."
  type        = string
}

variable "ambiente" {
  description = "Nome do ambiente (dev, prd)."
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde os recursos de rede (EFS, Grafana) serão criados."
  type        = string
  default     = null # Torna opcional se a stack não for criada
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets (privadas) para o EFS e Grafana."
  type        = list(string)
  default     = [] # Torna opcional
}
