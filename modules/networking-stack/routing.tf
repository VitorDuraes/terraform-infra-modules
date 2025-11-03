resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(local.tags, {
    Name = "${local.nome_ambiente}-rt-publica"
  })
}

resource "aws_route_table_association" "publica" {
  count = length(aws_subnet.publica)

  subnet_id      = aws_subnet.publica[count.index].id
  route_table_id = aws_route_table.publica.id
}


resource "aws_eip" "nat" {
  count = length(var.azs)

  tags = merge(local.tags, {
    Name = "${local.nome_ambiente}-nat-eip-${count.index + 1}"
  })
}

resource "aws_nat_gateway" "nat" {
  count = length(var.azs)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.publica[count.index].id

  tags = merge(local.tags, {
    Name = "${local.nome_ambiente}-nat-gw-${count.index + 1}"
  })
}

resource "aws_route_table" "privada" {
  count = length(var.azs)

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = merge(local.tags, {
    Name = "${local.nome_ambiente}-rt-privada-${count.index + 1}"
  })
}

resource "aws_route_table_association" "privada" {
  count = length(aws_subnet.privada)

  subnet_id      = aws_subnet.privada[count.index].id
  route_table_id = aws_route_table.privada[count.index].id
}
