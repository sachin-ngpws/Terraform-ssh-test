output "public_key" {
  value = module.keys.public_key_pem
  sensitive = true
}