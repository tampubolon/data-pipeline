resource "aws_s3_bucket" "input_bucket" {
  bucket = "S3_INPUT"
  acl    = "private"

  tags = {
    name        = "S3_INPUT"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/s3/s3-input"
    Attributes  = "s3-bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "input_bucket_block" {
  bucket = aws_s3_bucket.input_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "input_bucket_lifecycle" {
  bucket = aws_s3_bucket.input_bucket.id

  rule {
    id      = "expire-old-data"
    enabled = true

    expiration {
      days = 90 # Adjust based on your data retention policy
    }

    filter {
      prefix = "" # Apply this rule to all objects
    }
  }
}

resource "aws_s3_bucket_object" "document_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "document/"
}

resource "aws_s3_bucket_object" "picture_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "picture/"
}

resource "aws_s3_bucket_object" "video_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "video/"
}

resource "aws_s3_bucket_object" "file_3d_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "3d-file/"
}