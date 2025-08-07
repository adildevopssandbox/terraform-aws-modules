output "ec2_key_name" {
  description = "Name of the generated EC2 key pair"
  value       = aws_key_pair.ec2_key.key_name
}
