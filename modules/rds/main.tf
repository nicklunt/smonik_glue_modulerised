resource "random_password" "rds" {
  length = 16
  special = false
}

resource "aws_db_subnet_group" "this" {
  name       = "nl-smonik-db-subnet-group"
  subnet_ids = var.rds_subnet_group_ids
}

resource "aws_rds_cluster" "this" {
  backup_retention_period             = 1
  cluster_identifier                  = "nl-smonik-glue-db"
  cluster_members                     = []
  copy_tags_to_snapshot               = false
  database_name                       = "custodianmdr"
  db_cluster_parameter_group_name     = "default.aurora-postgresql10"
  db_subnet_group_name                = aws_db_subnet_group.this.name
  deletion_protection                 = false
  enable_http_endpoint                = true
  enabled_cloudwatch_logs_exports     = []
  engine                              = "aurora-postgresql"
  engine_mode                         = "serverless"
  engine_version                      = "10.14"
  iam_database_authentication_enabled = false
  iam_roles                           = []
  master_username              = var.aurora_admin_username
  master_password              = random_password.rds.result
  port                         = 5432
  preferred_backup_window      = "03:00-03:30"
  preferred_maintenance_window = "wed:08:21-wed:08:51"
  skip_final_snapshot          = true
  storage_encrypted            = true

  vpc_security_group_ids = [
    var.rds_sg
  ]

  scaling_configuration {
    auto_pause               = true
    max_capacity             = 8
    min_capacity             = 2
    seconds_until_auto_pause = 300
    timeout_action           = "RollbackCapacityChange"
  }

  tags = merge (
    var.tags,
    { "Name" = "nl-smonik-glue-RDS-db" },
  )

}