output "security_group_id" {
  value = aws_security_group.sec.id
}

output "security_group" {
  value = aws_security_group.sec
  sensitive = true
}