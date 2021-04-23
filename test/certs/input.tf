variable "RSA_bit_size" {
   description = "The size of the RSA algorithm to be use"
  default = 4096
  type = number
  validation {
    condition = var.RSA_bit_size > 1024 && (var.RSA_bit_size % 1024) == 0
    error_message = "The present value is not allowed, only multiples of 1024 greater than 1024 are allowed."
  }
}