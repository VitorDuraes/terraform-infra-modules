variable "nome_cluster" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "varsao_kubernetes" {
  description = "Versão do K8s (ex: '1.29')."
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "ID da VPC onde o cluster será criado"
  type        = string
}

variable "ids_subnets" {
  description = "Lista de IDs das subnets (PRIVADAS) para os workers."
  type        = list(string)
}

variable "tag_comuns" {
  description = "Tags para aplicar a todos os recursos"
  type        = map(string)
  default     = {}
}
