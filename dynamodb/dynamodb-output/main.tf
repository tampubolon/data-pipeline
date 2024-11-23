resource "aws_dynamodb_table" "dynamodb_output" {
  name         = "dynamodb-output"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id" # Partition Key

  tags = {
    name        = "dynamodb-output"
    environment = "development"
    Owner       = "team-infrastructure"
    ManagedBy   = "terraform"
    TFProject   = "github.com/tampubolon/data-pipeline/dynamodb/dynamodb-output"
    Attributes  = "s3-bucket"
  }

  # Uncomment the following for Provisioned Capacity Mode
  # read_capacity  = 5
  # write_capacity = 5

  # Partition Key (hash key)
  attribute {
    name = "id"
    type = "S" # S = String, N = Number, B = Binary
  }

  # Sort Key (Optional)
  # Define the sort key in the attribute block and set `range_key` instead of `sort_key`
  range_key = "sort_key_name"

  attribute {
    name = "sort_key_name"
    type = "S"
  }

  # Global Secondary Index (GSI)
  global_secondary_index {
    name            = "CreatedAtIndex"
    hash_key        = "created_at"
    projection_type = "ALL" # Options: KEYS_ONLY, INCLUDE, ALL
  }

  # GSI Attribute
  attribute {
    name = "created_at"
    type = "N" # N = Number
  }

  # TTL Configuration (Optional)
  ttl {
    attribute_name = "ttl_attribute" # Replace with your TTL attribute name
    enabled        = true
  }
}