output "vpc_id" {
  description = "O ID da VPC criada."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "O bloco CIDR da VPC."
  value       = aws_vpc.this.cidr_block
}

output "ids_subnets_publicas" {
  description = "Lista de IDs das subnets públicas."
  value       = aws_subnet.publica[*].id
}

output "ids_subnets_privadas" {
  description = "Lista de IDs das subnets privadas."
  value       = aws_subnet.privada[*].id
}

output "id_sg_default" {
  description = "ID do Security Group padrão (interno)."
  value       = aws_security_group.default.id
}
