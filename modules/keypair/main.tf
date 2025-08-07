resource "tls_private_key" "key_gen" {
  algorithm = var.key_algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.key_gen.public_key_openssh
}

resource "local_sensitive_file" "private_key_file" {
  content          = tls_private_key.key_gen.private_key_pem
  filename         = var.private_key_output_path
  file_permission  = var.private_key_permission
}
