variable "nomes_repositorios" {
  description = "Lista dos nomes dos microsserviços (ex: ['login-api, 'frontend'])"
  type        = list(string)
}

variable "tags_comuns" {
  description = "Tags para aplicar a todos os recursos"
  type        = map(string)
  default     = {}
}
