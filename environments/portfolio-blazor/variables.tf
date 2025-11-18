variable "regiao_aws" {
  description = "A regiao da AWS onde os recursos serao criados (ex: us-east-1)."
  type        = string
}

variable "nome_projeto" {
  description = "Nome base para identificar todos os recursos deste projeto (ex: portfolio-blazor)."
  type        = string
  default     = "portfolio-blazor"
}

variable "ambiente" {
  description = "O ambiente de deploy (ex: 'dev', 'stg', 'prd')."
  type        = string
  default     = "prd"
}
