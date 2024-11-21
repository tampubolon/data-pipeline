resource "aws_s3_bucket" "test" {
  bucket = "test-bucket"

  tags = {
    name        = "atlantis-test-bucket"
    environment = "dev"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/s3/test-bucket"
    Attributes  = "s3-bucket"
  }
}