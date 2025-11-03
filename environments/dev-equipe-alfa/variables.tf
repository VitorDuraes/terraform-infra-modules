variable "regiao_aws" {
  description = "A região da AWS para criar os recursos (ex: us-east-1)."
  type        = string
}

variable "nome_equipe" {
  description = "Nome da equipe dona da infra (ex: equipe-alfa)."
  type        = string
}

variable "ambiente" {
  description = "Nome do ambiente (ex: dev, prd)."
  type        = string
}

variable "db_username" {
  description = "Usuário master para o banco de dados RDS."
  type        = string
  sensitive   = true # Marca como sensível
}

variable "db_password" {
  description = "Senha master para o banco de dados RDS."
  type        = string
  sensitive   = true # Marca como sensível
}
