module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet_name  = var.public_subnet_name
  public_az           = var.public_az
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_name = var.private_subnet_name
  private_az          = var.private_az
  igw_name            = var.igw_name
  route_table_name    = var.route_table_name
  environment         = var.environment
  owner               = var.owner
  cost_center         = var.cost_center
  extra_tags          = {}
}

module "ec2" {
  source               = "./modules/ec2"
  sg_name              = "web-sg"
  vpc_id               = module.vpc.vpc_id
  ingress_rules        = var.ingress_rules
  instance_count       = var.instance_count
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = module.vpc.public_subnet_id
  instance_name_prefix = var.instance_name_prefix
  environment          = var.environment
  owner                = var.owner
  cost_center          = var.cost_center
  extra_tags           = {}
}

module "elb" {
  source      = "./modules/elb"
  sg_name     = "elb-sg"
  vpc_id      = module.vpc.vpc_id
  elb_name    = var.elb_name
  subnets     = [module.vpc.public_subnet_id]
  instances   = module.ec2.instance_ids
  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center
  extra_tags  = {}
}

module "autoscaling" {
  source             = "./modules/autoscaling"
  lt_name_prefix     = var.lt_name_prefix
  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [module.ec2.security_group_id]
  subnet_id          = module.vpc.public_subnet_id
  asg_name           = var.asg_name
  max_size           = var.max_size
  min_size           = var.min_size
  desired_capacity   = var.desired_capacity
  subnets            = [module.vpc.public_subnet_id]
  environment        = var.environment
  owner              = var.owner
  cost_center        = var.cost_center
  extra_tags         = {}
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-locks"
    environment = var.environment
    owner       = var.owner
    cost_center = var.cost_center
  }
}
