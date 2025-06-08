output "launch_template_id" {
  value = aws_launch_template.web.id
}

output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "asg_arn" {
  value = aws_autoscaling_group.asg.arn
}

output "asg_capacity" {
  value = aws_autoscaling_group.asg.desired_capacity
}
