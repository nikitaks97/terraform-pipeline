# EC2 Module

## Purpose
Creates EC2 instances and a security group, with tagging and flexible ingress rules.

## Inputs
- `sg_name` (string)
- `vpc_id` (string)
- `ingress_rules` (map)
- `instance_count` (number)
- `ami` (string)
- `instance_type` (string)
- `key_name` (string, sensitive)
- `subnet_id` (string)
- `instance_name_prefix` (string)
- `environment`, `owner`, `cost_center`, `extra_tags` (for tagging)

## Outputs
- `instance_ids`, `public_ips`, `private_ips`, `security_group_id`

## Example
```hcl
module "ec2" {
  source = "./modules/ec2"
  # ...variables...
}
```
