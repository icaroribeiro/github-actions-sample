terraform {
  required_providers {
    aws = {
      source  = "hashcorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags = {
    tags = {}
  }
}
