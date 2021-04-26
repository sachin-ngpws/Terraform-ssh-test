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
  source = "../../modules/certs"
}

data "aws_vpc" "default" {
  default = true
}

module "ubuntu_20_04" {
  source = "../../modules/UbuntuImage"
}

module "security" {
  source = "../../modules/Security-Group"
  name = "simple-ssh"
  vpc = data.aws_vpc.default.id
}

module "sever" {
  source = "../../modules/VM"
  ami = module.ubuntu_20_04.AMI
  security_group = "sg-0b07554acd9ae1d4a" //module.security.security_group_id
}