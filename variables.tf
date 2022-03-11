## vpc vars
variable "vpc_cidr" {
  default = "10.136.16.0/20"
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}

## subnet vars
variable "web_sn_cidr_block" {
  default = "10.136.20.0/23"
}

variable "app_sn_cidr_block" {
  default = "10.136.22.0/23"
}

variable "db_sn_cidr_block" {
  type = list(string)
  default = ["10.136.24.0/23", "10.136.26.0/23"]
}

variable "subnet_aza" {
  default = "eu-west-2a"
}

variable "subnet_azb" {
  default = "eu-west-2b"
}

variable "db_subnets" {
  type = list
  default = ["eu-west-2a", "eu-west-2b"]
}

## rds vars
variable "aurora_admin_username" {
  type = string
  default = "sa"
}

# variable "rds_sg" {
#   type = string
# }

## default tags
variable "tags" {
  default = {
    Product = "Smonik Glue"
    Owner   = "nick lunt"
  }
}