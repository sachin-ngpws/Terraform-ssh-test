terraform {
  required_version = ">=0.14.5"
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "keys" {
  source = "../../modules/certs"
  bit_size = var.RSA_bit_size
}