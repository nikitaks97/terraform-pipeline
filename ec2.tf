variable "ingress_rules" {
  default = {
    ssh  = { from_port = 22,  to_port = 22,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    http = { from_port = 80,  to_port = 80,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    https= { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP/HTTPS/SSH"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.ingress_rules

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.web_sg.id
  cidr_blocks       = each.value.cidr_blocks
}

resource "aws_instance" "web_vm" {
  count                   = 3  # Change this to the number of instances you want
  ami                     = "ami-0f9de6e2d2f067fca" # Replace with valid AMI
  instance_type           = "t2.micro"
  key_name                = "k3s_key"
  vpc_security_group_ids  = [aws_security_group.web_sg.id]
  subnet_id               = aws_subnet.public.id

  tags = {
    Name = "tf-vm-${count.index + 1}"
  }
}
