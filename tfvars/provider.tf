terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
  backend "s3" {
    bucket = "81s-govi"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}