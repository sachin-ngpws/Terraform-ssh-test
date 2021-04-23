output "private_key" {
  value = module.keys.private_key
}

output "public_key" {
  value = module.keys.public_key
}

output "vpc" {
    value = data.aws_vpc.default.id
}