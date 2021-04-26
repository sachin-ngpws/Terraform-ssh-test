resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits = var.bit_size
}