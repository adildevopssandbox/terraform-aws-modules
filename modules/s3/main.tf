resource "aws_s3_bucket" "static_site" {
  bucket = var.s3_bucket_name
  tags = {
    Name = "private-bucket"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.static_site.id
  versioning_configuration {
    status = "Enabled"
  }
}