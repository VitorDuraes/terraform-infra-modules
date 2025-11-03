resource "aws_efs_file_system" "this" {
  count = local.count

  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  creation_token   = "${local.prefixo_recurso}-efs-persistence"

  tags = merge(local.tags_comuns, {
    Name = "${local.prefixo_recurso}-efs"
  })
}

resource "aws_security_group" "efs" {
  count = local.count

  name        = "${local.prefixo_recurso}-efs-sg"
  description = "Permite acesso NFS ao EFS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.grafana[0].id]
  }

  tags = local.tags_comuns
}


resource "aws_efs_mount_target" "this" {

  count = local.count * length(var.subnet_ids)

  file_system_id  = aws_efs_file_system.this[0].id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = [aws_security_group.efs[0].id]
}
