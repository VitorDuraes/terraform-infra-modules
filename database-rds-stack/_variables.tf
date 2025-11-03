variable "name_db" {
  description = "Nome do banco de dados RDS. Exemplo: mydatabase"
  type        = string
}

variable "engine" {
  description = "Tipo do mecanismo do banco de dados. Exemplo: mysql, postgres"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Versão da engine"
  type        = string
  default     = "14.6"
}

variable "db_instance_class" {
  description = "Classe da instância (ex: 'db.t3.micro)."
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "Usuário master do banco"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Senha do usuário master do banco"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "ID da VPC onde o banco será criado"
  type        = string
}

variable "ids_subnets_db" {
  description = "Lista de IDs das subnets (PRIVADAS) para o RDS"
  type        = list(string)
}

variable "id_sg_acesso_db" {
  description = "ID do Security Group que permitirá acesso ao RDS"
  type        = string
}

variable "tag_comuns" {
  description = "Tags para aplicar a todos os recursos"
  type        = map(string)
  default     = {}
}
