output "rds_password" {
    sensitive = true
    value = aws_rds_cluster.this.master_password
}

output "rds_endpoint" {
  value = aws_rds_cluster.this.endpoint
}