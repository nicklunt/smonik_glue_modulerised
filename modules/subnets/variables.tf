variable "vpc_id" {
    type = string
}

variable "cidr_block" {
  type = string
}

variable "availability_zone" {
    type = string
}

variable "tags" {
  description = "Tags to set on the subnet."
  type        = map(string)
  default     = {}
}

variable "name" {
  type = string
}