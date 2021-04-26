variable "security_group" {
  description = "The security group, the rules that will be applied to the vm."
  type = string

  validation {
    condition = can(regex("^sg-",var.security_group))
    error_message = "The input is not a valid security group name."
  }
}

variable "ami" {
  description = "The ami is the image the vm will run."
  type = string

  validation {
    condition = can(regex("^ami-",var.ami))
    error_message = "The input is not a valid ami name."
  }
}

variable "instance_type" {
  description = "The type of instance on aws."
  type = string
  default = "t2.micro"

  validation {
    condition = can(regex("^t2",var.instance_type))
    error_message = "Only the t2 family of machine types are allowed."
  }
}

variable "instance_name" {
  description = "The name tag value for the VM."
  default = "Test-ssh-golang"
}