resource "aws_security_group" "web_sg" {
  name        = var.sg_name
  description = "Allow HTTP/HTTPS/SSH"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.ingress_rules

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.web_sg.id
  cidr_blocks       = each.value.cidr_blocks
  description       = "Allow ${each.key}"
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_instance" "web_vm" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = var.subnet_id

  tags = merge({
    Name = "${var.instance_name_prefix}-${count.index + 1}",
    environment = var.environment,
    owner = var.owner,
    cost_center = var.cost_center
  }, var.extra_tags)
}
