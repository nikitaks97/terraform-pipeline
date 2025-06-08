variable "vpc_cidr" {}
variable "vpc_name" { default = "vpc-tf" }
variable "public_subnet_cidr" {}
variable "public_subnet_name" { default = "public-subnet-tf" }
variable "public_az" { default = "us-east-1a" }
variable "private_subnet_cidr" {}
variable "private_subnet_name" { default = "private-subnet-tf" }
variable "private_az" { default = "us-east-1b" }
variable "igw_name" { default = "igw-tf" }
variable "route_table_name" { default = "rtb-tf" }
variable "environment" { type = string }
variable "owner" { type = string }
variable "cost_center" { type = string }
variable "extra_tags" {
  type    = map(string)
  default = {}
}
