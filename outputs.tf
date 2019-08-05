output "id" {
  value = aws_security_group.main.id
}

output "name" {
  value = aws_security_group.main.name
}

output "vpc_id" {
  value = aws_security_group.main.vpc_id
}

output "ingress" {
  value = aws_security_group.main.ingress
}

output "egress" {
  value = aws_security_group.main.egress
}
