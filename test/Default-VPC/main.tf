terraform {
  required_version = ">=0.14.5"
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-2"
}


module "keys" {
  source = "../../modlues/certs"
}

data "aws_vpc" "default" {
  default = true
}