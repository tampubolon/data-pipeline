resource "aws_s3_bucket" "test" {
  bucket = "test-bucket"

  tags = {
    name        = "atlantis-test-bucket"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/s3/test-bucket"
    Attributes  = "s3-bucket"
  }
}