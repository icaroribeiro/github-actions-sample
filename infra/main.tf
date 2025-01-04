resource "aws_s3_bucket" "state_s3_bucket" {
  bucket = var.state_s3_bucket_name
}
