terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "queenkabalti-vaish1234"
    key = "mystatefile/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "vaishtable01"
    hash_key       = "LockID"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key

}

