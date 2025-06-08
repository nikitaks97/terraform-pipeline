variable "sg_name" { default = "elb-sg" }
variable "vpc_id" {}
variable "elb_name" { default = "tf-elb" }
variable "subnets" { type = list(string) }
variable "instances" { type = list(string) }
variable "environment" { type = string }
variable "owner" { type = string }
variable "cost_center" { type = string }
variable "extra_tags" {
  type    = map(string)
  default = {}
}
