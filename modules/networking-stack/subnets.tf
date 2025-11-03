resource "aws_subnet" "publica" {
  count = length(var.azs)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = local.cidrs_subnets_publicas[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(local.tags, {
    Name = "${local.nome_ambiente}-subnet-publica-${count.index + 1}"
  })
}

resource "aws_subnet" "privada" {
  count = length(var.azs)

  vpc_id            = aws_vpc.this.id
  cidr_block        = local.cidrs_subnets_privadas[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(local.tags, {
    Name = "${local.nome_ambiente}-subnet-privada-${count.index + 1}"
  })
}
