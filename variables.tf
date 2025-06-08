# -------------------
# Networking Variables
# -------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
  validation {
    condition     = can(cidrnetmask(var.public_subnet_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR block"
  type        = string
  default     = "10.0.2.0/24"
  validation {
    condition     = can(cidrnetmask(var.private_subnet_cidr))
    error_message = "Must be a valid CIDR block."
  }
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "vpc-tf"
}

variable "public_subnet_name" {
  description = "Name for the public subnet"
  type        = string
  default     = "public-subnet-tf"
}

variable "public_az" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_name" {
  description = "Name for the private subnet"
  type        = string
  default     = "private-subnet-tf"
}

variable "private_az" {
  description = "Availability zone for the private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
  default     = "igw-tf"
}

variable "route_table_name" {
  description = "Name for the Route Table"
  type        = string
  default     = "rtb-tf"
}

# -------------------
# Compute Variables
# -------------------
variable "ami" {
  description = "AMI ID for EC2/ASG"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = contains(["t2.micro", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Instance type must be t2.micro, t3.micro, or t3.small."
  }
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  sensitive   = true
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 3
}

variable "instance_name_prefix" {
  description = "Prefix for EC2 instance names"
  type        = string
  default     = "tf-vm"
}

# -------------------
# Security Variables
# -------------------
variable "ingress_rules" {
  description = "Map of ingress rules for EC2 security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    ssh = {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    http = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    https = {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

# -------------------
# ELB Variables
# -------------------
variable "elb_name" {
  description = "Name for the ELB"
  type        = string
  default     = "tf-elb"
}

# -------------------
# Autoscaling Variables
# -------------------
variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
  default     = "tf-asg"
}

variable "lt_name_prefix" {
  description = "Prefix for Launch Template name"
  type        = string
  default     = "tft"
}

variable "max_size" {
  description = "Max size for Auto Scaling Group"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Min size for Auto Scaling Group"
  type        = number
  default     = 1
}

variable "desired_capacity" {
  description = "Desired capacity for Auto Scaling Group"
  type        = number
  default     = 2
}

# -------------------
# Tagging & Metadata
# -------------------
variable "environment" {
  description = "Environment tag (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner tag for resources"
  type        = string
  default     = ""
}

variable "cost_center" {
  description = "Cost center tag for resources"
  type        = string
  default     = ""
}