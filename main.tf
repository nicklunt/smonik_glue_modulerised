module "primary_vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  name                 = "nl-smonik-vpc"

  tags = var.tags
}

module "web_subnet" {
  source = "./modules/subnets"

  vpc_id            = module.primary_vpc.vpc_id
  cidr_block        = var.web_sn_cidr_block
  availability_zone = var.subnet_aza
  name              = "nl-smonik-web-subnet"

  tags = var.tags
}

module "app_subnet" {
  source = "./modules/subnets"

  vpc_id            = module.primary_vpc.vpc_id
  cidr_block        = var.app_sn_cidr_block
  availability_zone = var.subnet_aza
  name              = "nl-smonik-app-subnet"

  tags = var.tags
}

module "db_subnet" {
  source = "./modules/subnets"

  count = 2

  vpc_id            = module.primary_vpc.vpc_id
  cidr_block        = var.db_sn_cidr_block[count.index]
  availability_zone = var.db_subnets[count.index]
  name              = "nl-smonik-db-subnet-${count.index}"

  tags = var.tags
}

module "rds" {
  source = "./modules/rds"

  # aws_db_subnet_group
  rds_subnet_group_ids = [module.db_subnet[0].subnet_id, module.db_subnet[1].subnet_id]

  # aws_rds_cluster
  aurora_admin_username = var.aurora_admin_username
  rds_sg = module.sgs.rds_sg

  tags = var.tags
}

module "sgs" {
  source = "./modules/security_groups"

  vpc_id = module.primary_vpc.vpc_id
  db_cidr_blocks = [module.db_subnet[0].cidr_block, module.db_subnet[1].cidr_block]
}