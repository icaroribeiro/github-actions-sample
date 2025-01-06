variable "aws_state_file_s3_bucket" {
  type        = string
  description = "The name of s3 bucket where Terraform state files are stored"
}

variable "aws_state_lock_dynamodb_table" {
  type        = string
  description = "The name of DynamoDB table where Terraform state locks are stored"
}

variable "aws_region" {
  type        = string
  description = "The AWS region where AWS services are hosted"
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "branch" {
  type        = string
  description = "The name of the branch"
}
