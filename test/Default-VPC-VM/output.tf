output "private_key" {
  value = module.keys.private_key
  sensitive = true
}

output "public_key" {
  value = module.keys.public_key
  sensitive = true
}

output "vpc" {
    value = data.aws_vpc.default.id
}

output "external_ip" {
  value = module.sever.external_ip
}

output "key_name" {
  value = module.ssh-key.key
}