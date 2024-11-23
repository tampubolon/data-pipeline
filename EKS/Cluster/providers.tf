terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-martin"
    key     = "pintu-infra/data-pipeline/eks/cluster.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}