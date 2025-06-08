resource "aws_security_group" "elb_sg" {
  name        = var.sg_name
  description = "Allow ELB traffic"
  vpc_id      = var.vpc_id

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

resource "aws_elb" "main" {
  name               = var.elb_name
  subnets            = var.subnets
  security_groups    = [aws_security_group.elb_sg.id]
  instances          = var.instances
  cross_zone_load_balancing = true

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
  }
  tags = merge({
    Name = var.elb_name,
    environment = var.environment,
    owner = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}
