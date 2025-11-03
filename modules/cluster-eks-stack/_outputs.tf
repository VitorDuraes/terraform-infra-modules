output "cluster_name" {
  description = "Nome do cluster EKS."
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Endpoint do K8s API server."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "CA do cluster (necessário para configurar o kubectl)."
  value       = aws_eks_cluster.this.certificate_authority[0].data
  sensitive   = true
}
