output "instance_ids" {
  value = aws_instance.web_vm[*].id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "public_ips" {
  value = aws_instance.web_vm[*].public_ip
}

output "private_ips" {
  value = aws_instance.web_vm[*].private_ip
}
