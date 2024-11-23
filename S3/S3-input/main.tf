resource "aws_s3_bucket" "input_bucket" {
  bucket = "s3-input-martinustpb"

  tags = {
    name        = "s3-input-martinustpb"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/s3/s3-input"
    Attributes  = "s3-bucket"
  }
}

resource "aws_s3_bucket_acl" "input_bucket_acl" {
  bucket = aws_s3_bucket.input_bucket.id
  acl    = "private"
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
    id     = "expire-old-data"
    status = "Enabled"

    transition {
      days          = 30 # After 30 days, transition to Glacier storage
      storage_class = "GLACIER"
    }

    expiration {
      days = 3660
    }

    filter {
      prefix = ""
    }
  }
}

resource "aws_s3_object" "document_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "documents/"
  acl    = "private"
}

resource "aws_s3_object" "picture_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "pictures/"
  acl    = "private"
}

resource "aws_s3_object" "video_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "videos/"
  acl    = "private"
}

resource "aws_s3_object" "file_3d_folder" {
  bucket = aws_s3_bucket.input_bucket.id
  key    = "3d-files/"
  acl    = "private"
}