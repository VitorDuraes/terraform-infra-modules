output "grafana_endpoint" {
  description = "A URL do workspace Grafana."
  value       = try(aws_grafana_workspace.this[0].endpoint, null)
}

output "prometheus_workspace_id" {
  description = "O ID do workspace Prometheus (AMP)."
  value       = try(aws_prometheus_workspace.this[0].id, null)
}

output "prometheus_remote_write_url" {
  description = "URL para enviar métricas (remote_write)."
  value       = try(aws_prometheus_workspace.this[0].prometheus_endpoint, null)
}

output "efs_id" {
  description = "O ID do File System (EFS)."
  value       = try(aws_efs_file_system.this[0].id, null)
}
