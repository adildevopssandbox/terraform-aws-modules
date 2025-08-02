terraform {
  backend "s3" {
    bucket = "terraform-backend-aa1"
    key    = "terraform/state"
    region = "us-east-1"
  }
}