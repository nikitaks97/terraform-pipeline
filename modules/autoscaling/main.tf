resource "aws_launch_template" "web" {
  name_prefix             = var.lt_name_prefix
  image_id                = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_security_group_ids  = var.security_group_ids
 # subnet_id             = var.subnet_id
  metadata_options {
    http_tokens = "required"
  }
  tag_specifications {
    resource_type = "instance"
    tags = merge({
      Name        = var.lt_name_prefix,
      environment = var.environment,
      owner       = var.owner,
      cost_center = var.cost_center
    }, var.extra_tags)
  }
}

resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnets
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }
  tag {
    key                 = "environment"
    value               = var.environment
    propagate_at_launch = true
  }
  tag {
    key                 = "owner"
    value               = var.owner
    propagate_at_launch = true
  }
  tag {
    key                 = "cost_center"
    value               = var.cost_center
    propagate_at_launch = true
  }
}
