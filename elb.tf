# Existing security group
resource "aws_security_group" "elb_sg" {
  name        = "elb-sg"
  description = "Allow HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Classic Load Balancer
resource "aws_elb" "classic_lb" {
  name               = "classic-web-lb"
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.web_vm[*].id
  security_groups             = [aws_security_group.elb_sg.id]
  cross_zone_load_balancing  = true
  idle_timeout               = 60
  connection_draining        = true
  connection_draining_timeout = 300

  tags = {
    Name = "classic-lb"
  }
}