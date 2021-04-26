resource "aws_instance" "vm" {
  ami = var.ami
  instance_type = var.instance_type
//  security_groups = [var.security_group]
  vpc_security_group_ids = [var.security_group]
  key_name = var.key_name
  tags = {
    Name = var.instance_name
  }
}