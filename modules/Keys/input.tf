variable "public_key" {
  description = "The ssh public key for the vm."
  type = string
}

variable "name" {
  description = "The name of the key being created."
  default = "GO-lang"
}