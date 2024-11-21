terraform {
  required_version = "= 1.9.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-martinus"
    key     = "data-pipeline/s3/test-bucket.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}