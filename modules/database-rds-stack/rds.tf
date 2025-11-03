resource "aws_db_subnet_group" "this" {
  name       = "${var.name_db}-subnet-group"
  subnet_ids = var.ids_subnets_db

  tags = merge(var.tag_comuns, {
    Name = "${var.name_db}-subnet-group"
  })
}

resource "aws_security_group" "db" {
  name        = "${var.name_db}-sg-db"
  description = "Security Group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.id_sg_acesso_db]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tag_comuns, {
    Name = "${var.name_db}-sg-db"
  })

}

resource "aws_db_instance" "this" {
  identifier     = var.name_db
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.db_instance_class

  username = var.db_username
  password = var.db_password

  allocated_storage = 20
  storage_type      = "gp2"

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.db.id]

  multi_az            = false # Mude para 'true' em produção
  skip_final_snapshot = true  # Mude para 'false' em produção

  tags = merge(var.tag_comuns, {
    ManagedBy = "Terraform"
    Modulo    = "database-rds-stack"
  })
}
