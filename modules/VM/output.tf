output "external_ip" {
  value = aws_instance.vm.public_ip
}