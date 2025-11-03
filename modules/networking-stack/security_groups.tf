resource "aws_security_group" "default" {
  name        = "${local.nome_ambiente}-sg-default"
  description = "SG Padrão: permite toda comunicação interna na VPC"
  vpc_id      = aws_vpc.this.id

  ingress {
    description      = "Permitir todo o tráfego interno na VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.cidr_vpc]
    ipv6_cidr_blocks = []
  }

  egress {
    description = "Permitir todo o tráfego de saída"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = []
  }
  tags = merge(
    local.tags,
    {
      Name = "${local.nome_ambiente}-sg-default"
    }
  )
}
