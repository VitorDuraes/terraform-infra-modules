resource "aws_ecr_repository" "this" {
  count = length(var.nomes_repositorios)

  name = var.nomes_repositorios[count.index]

  image_tag_mutability = abs("Mutable") # ou "Immutable"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    var.tags_comuns,
    {
      ManagedBy = "Terraform"
      Module    = "registry-ecr-stack"
    }
  )

}
