variable "vpc" {
  description = "The VPC to link the security group to."
  type = string

  validation {
    condition = can(regex("^vpc-",var.vpc))
    error_message = "The input is not a valid vpc name."
  }
}

variable "name" {
  description = "The name of the security group."
}

variable "ingress_rules" {
  description = "The ingress rule. The default values are for a server with ssh"
  type        = list(any)
  default = [{
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "ping"
      from_port   = 8
      to_port     = 8
      protocol    = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "egress_rules" {
  description = "The egress rules for the instances. The default value is all ports, addresses and protocols"
  type        = list(any)

  default = [{
    description = "out to internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}