variable "lt_name_prefix" { default = "tft" }
variable "ami" {}
variable "instance_type" { default = "t2.micro" }
variable "key_name" {}
variable "security_group_ids" { type = list(string) }
variable "subnet_id" {}
variable "asg_name" { default = "tf-asg" }
variable "max_size" { default = 3 }
variable "min_size" { default = 1 }
variable "desired_capacity" { default = 2 }
variable "subnets" { type = list(string) }
variable "environment" { type = string }
variable "owner" { type = string }
variable "cost_center" { type = string }
variable "extra_tags" {
  type    = map(string)
  default = {}
}
