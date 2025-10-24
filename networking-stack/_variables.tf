variable "nome_ambiente" {
  description = "Nome do ambiente (ex: dev, prod, staging)"
  type        = string
}
variable "cidr_vpc" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Lista de Zonas de disponibilidade (AZs) para usar (ex: ['us-east-1a', 'us-east-1b'])"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "tags_comuns" {
  description = "Tags comuns para todos os recursos"
  type        = map(string)
  default = {
    Projeto = "MeuProjeto"
    Owner   = "EquipeDevOps"
  }

}
