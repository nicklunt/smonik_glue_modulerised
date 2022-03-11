output "vpc_id" {
    value = module.primary_vpc.vpc_id
}

output "web_subnet_id" {
    value = module.web_subnet.subnet_id
}

output "app_subnet_id" {
    value = module.app_subnet.subnet_id
}

output "db_subnets" {
    value = module.db_subnet[*].subnet_id
}

output "rds_password" {
    sensitive = true
    value = module.rds.rds_password
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}