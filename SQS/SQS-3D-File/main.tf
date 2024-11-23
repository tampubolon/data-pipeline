resource "aws_sqs_queue" "sqs_3d_file" {
  name                       = "sqs-3d-file"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 0
  max_message_size           = 262144
  receive_wait_time_seconds  = 0

  tags = {
    name        = "sqs-3d-file"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/sqs/sqs-3d-file"
    Attributes  = "s3-bucket"
  }
}