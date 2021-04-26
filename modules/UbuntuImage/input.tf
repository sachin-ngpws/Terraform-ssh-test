variable "ubuntu_version" {
  description = "The version of ubuntu."
  default = "ubuntu-focal-20.04-amd64-server-*"
  type = string
  validation {
    condition = can(regex("^ubuntu-[a-z]+-[0-9]+.[0-9]+-amd64-server-",var.ubuntu_version))
    error_message = "The input is not a valid image name."
  }
}