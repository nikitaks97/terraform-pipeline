# VPC Module

## Purpose
Creates a VPC, public and private subnets, internet gateway, and route table with full tagging support.

## Inputs
- `vpc_cidr` (string)
- `vpc_name` (string)
- `public_subnet_cidr` (string)
- `public_subnet_name` (string)
- `public_az` (string)
- `private_subnet_cidr` (string)
- `private_subnet_name` (string)
- `private_az` (string)
- `igw_name` (string)
- `route_table_name` (string)
- `environment`, `owner`, `cost_center`, `extra_tags` (for tagging)

## Outputs
- `vpc_id`, `vpc_arn`, `public_subnet_id`, `public_subnet_arn`, `private_subnet_id`, `private_subnet_arn`

## Example
```hcl
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  # ...other variables...
}
```
