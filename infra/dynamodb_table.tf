resource "aws_dynamodb_table" "aws_state_lock_dynamodb_table" {
  name           = var.aws_state_lock_dynamodb_table
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 2

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"
}
