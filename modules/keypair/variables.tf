variable "key_name" {
  description = "name for the aws ec2 key pair"
  type        = string

}

variable "key_algorithm" {
  type        = string
  default     = "RSA"
  description = "algorithm for the key pair, default is RSA"
}

variable "rsa_bits" {
  description = "value for the rsa bits, default is 4096"
  type = number
  default = 4096
}

variable "private_key_output_path" {
  description = "Where to save the generated private key file"
  type        = string
  default     = "~/Desktop/terraform-aws-key.pem"
}

variable "private_key_permission" {
  description = "File permission mode for the private key"
  type        = string
  default     = "0600"
}

