output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "public_subnet_arn" {
  value = aws_subnet.public.arn
}

output "private_subnet_arn" {
  value = aws_subnet.private.arn
}
