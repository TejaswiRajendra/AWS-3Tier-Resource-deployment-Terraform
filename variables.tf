variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "mynewkey" # Replace with your key pair name
}

variable "db_username" {
  default = "tejaswi"
}

variable "db_password" {
  default = "tejaswidb" # Replace with a secure password
}