resource "aws_s3_bucket" "state_file_s3_bucket_access_logs" {
  bucket = var.state_file_s3_bucket_logs
}

resource "aws_S3_bucket_server_side_encryption_configuration" "state_file_s3_bucket_access_logs_encryption_configuration" {
  bucket = aws_s3_bucket.state_file_s3_bucket_access_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

    bucket_key_enabled = "true"
  }
}

resource "aws_S3_bucket_lifecycle_configuration" "state_file_s3_bucket_access_logs_lifecycle_configuration" {
  bucket = aws_s3_bucket.state_file_s3_bucket_access_logs.id

  rule {
    id     = "storage-class-transitions"
    status = "Enabled"
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
    expiration {
      days = 90
    }
  }
}

resource "aws_s3_bucket" "sate_file_s3_bucket" {
  bucket              = var.state_file_s3_bucket
  force_destroy       = false
  object_lock_enabled = false
}

resource "aws_S3_bucket_server_side_encryption_configuration" "state_file_s3_bucket_encryption_configuration" {
  bucket = aws_s3_bucket.sate_file_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

    bucket_key_enabled = "true"
  }
}

resource "aws_s3_bucket_logging" "state_file_s3_bucket_logging" {
  depends_on    = [aws_s3_bucket.state_file_s3_bucket, aws_s3_bucket.state_file_s3_bucket_access_logs]
  bucket        = aws_s3_bucket.sate_file_s3_bucket.id
  target_bucket = aws_s3_bucket.state_file_s3_bucket_access_logs.id
  target_prefix = "${aws_s3_bucket.state_file_s3_bucket.id}-logs/"
}
