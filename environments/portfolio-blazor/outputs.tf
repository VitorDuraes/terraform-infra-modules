output "EKS_CLUSTER_NAME" {
  value = module.eks.cluster_name
}
output "ECR_REPO_URL" {
  # Extrai a URL do mapa de saídas do módulo ECR
  value = module.ecr.urls_repositorios[var.nome_projeto]
}
