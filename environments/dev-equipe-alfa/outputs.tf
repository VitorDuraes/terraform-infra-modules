output "VPC_ID" {
  description = "ID da VPC principal"
  value       = module.rede.vpc_id
}

output "EKS_Cluster_Endpoint" {
  description = "Endpoint do API Server do Kubernetes"
  value       = module.eks.cluster_endpoint
}

output "RDS_Database_Endpoint" {
  description = "Host para conectar no banco de dados"
  value       = module.banco_de_dados.db_endpoint
}

output "Grafana_Endpoint" {
  description = "URL para acessar o Grafana"
  value       = module.observability.grafana_endpoint
}

output "ECR_Repositorios" {
  description = "URLs dos repositórios Docker"
  value       = module.ecr.urls_repositorios
}
