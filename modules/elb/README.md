# ELB Module

## Purpose
Creates a Classic Load Balancer and security group, with tagging support.

## Inputs
- `sg_name` (string)
- `vpc_id` (string)
- `elb_name` (string)
- `subnets` (list)
- `instances` (list)
- `environment`, `owner`, `cost_center`, `extra_tags` (for tagging)

## Outputs
- `elb_dns_name`, `elb_name`

## Example
```hcl
module "elb" {
  source = "./modules/elb"
  # ...variables...
}
```
