output "urls_repositorios" {
  description = "Mapa de nome do repo para a URL do repo."
  value = {
    for repo in aws_ecr_repository.this : repo.name => repo.repository_url
  }
}

output "arns_repositorios" {
  description = "Mapa de nome do repo para o ARN do repo."
  value = {
    for repo in aws_ecr_repository.this : repo.name => repo.arn
  }
}
