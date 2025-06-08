# Autoscaling Module

## Purpose
Creates a Launch Template and Auto Scaling Group with tagging support.

## Inputs
- `lt_name_prefix` (string)
- `ami` (string)
- `instance_type` (string)
- `key_name` (string, sensitive)
- `security_group_ids` (list)
- `subnet_id` (string)
- `asg_name` (string)
- `max_size` (number)
- `min_size` (number)
- `desired_capacity` (number)
- `subnets` (list)
- `environment`, `owner`, `cost_center`, `extra_tags` (for tagging)

## Outputs
- `launch_template_id`, `asg_name`, `asg_arn`, `asg_capacity`

## Example
```hcl
module "autoscaling" {
  source = "./modules/autoscaling"
  # ...variables...
}
```
