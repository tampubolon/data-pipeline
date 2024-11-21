resource "aws_s3_bucket" "test" {
  bucket = "atlantis-test-s3"

  tags = {
    name        = "atlantis-test-s3"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/s3/atlantis-test-s3"
    Attributes  = "s3-bucket"
  }
}