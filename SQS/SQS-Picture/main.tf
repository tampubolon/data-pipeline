resource "aws_sqs_queue" "sqs_picture" {
  name                       = "sqs-picture"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 0
  max_message_size           = 262144
  receive_wait_time_seconds  = 0

  tags = {
    name        = "sqs-picture"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/sqs/sqs-picture"
    Attributes  = "s3-bucket"
  }
}