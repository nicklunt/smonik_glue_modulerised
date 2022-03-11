variable "rds_subnet_group_ids" {
  type = list
}

variable "aurora_admin_username" {
  type = string
}

variable "rds_sg" {
  type = string
}

variable "tags" {
  description = "Tags to set on the vpc."
  type        = map(string)
  default     = {}
}