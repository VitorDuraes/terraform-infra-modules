resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.nome_cluster}-default-nodes"
  node_role_arn   = aws_iam_role.eks_nodegroup.arn
  subnet_ids      = var.ids_subnets

  instance_types = ["t3.medium"] # Mude conforme necessidade

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_policy_1,
    aws_iam_role_policy_attachment.eks_node_policy_2,
    aws_iam_role_policy_attachment.eks_node_policy_3,
  ]

  tags = merge(var.tag_comuns, {
    Name = "${var.nome_cluster}-default-nodes"
  })
}
