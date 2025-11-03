output "db_endpoint" {
  description = "O endpoint (host) do banco de dados."
  value       = aws_db_instance.this.endpoint
}

output "db_port" {
  description = "A porta do banco de dados."
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "O nome do banco de dados."
  value       = aws_db_instance.this.name
}
