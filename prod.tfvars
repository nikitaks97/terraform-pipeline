vpc_cidr            = "10.2.0.0/16"
public_subnet_cidr  = "10.2.1.0/24"
private_subnet_cidr = "10.2.2.0/24"
environment         = "prod"
owner               = "prod-team"
cost_center         = "3001"
instance_type       = "t3.small"
instance_count      = 3
asg_name            = "prod-asg"
lt_name_prefix      = "prod-tft"
