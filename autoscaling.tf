resource "aws_launch_template" "example" {
  name_prefix   = "tft"
  image_id      = "ami-0f9de6e2d2f067fca" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  key_name = "k3s_key" # Replace with your key pair name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "example-instance"
    }
  }
}
# Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  name                      = "example-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  vpc_zone_identifier       = [aws_subnet.public.id, aws_subnet.private.id]
  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-tf"
    propagate_at_launch = true
  }
}