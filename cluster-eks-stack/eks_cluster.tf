resource "aws_eks_cluster" "this" {
  name     = var.nome_cluster
  version  = var.varsao_kubernetes
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = var.ids_subnets
    # endpoint_private_access = true # Recomendado para produção
    # endpoint_public_access  = false # Recomendado para produção
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = merge(var.tag_comuns, {
    ManagedBy = "Terraform"
    Modulo    = "cluster-eks-stack"
  })
}
