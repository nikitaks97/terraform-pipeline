variable "sg_name" { default = "web-sg" }
variable "vpc_id" {}
variable "ingress_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
variable "instance_count" { default = 3 }
variable "ami" {}
variable "instance_type" { default = "t2.micro" }
variable "key_name" {}
variable "subnet_id" {}
variable "instance_name_prefix" { default = "tf-vm" }
variable "environment" { type = string }
variable "owner" { type = string }
variable "cost_center" { type = string }
variable "extra_tags" {
  type    = map(string)
  default = {}
}
