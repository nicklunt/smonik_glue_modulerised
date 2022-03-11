variable "vpc_cidr" {
    type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
    type = bool
}

variable "tags" {
  description = "Tags to set on the vpc."
  type        = map(string)
  default     = {}
}

variable "name" {
  type = string
}