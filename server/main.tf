# Configure the AWS Provider
provider "aws" {
  region = var.region
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}

terraform {
  backend "s3" {
    bucket         = "lab-viana-terraform-state-bucket"
    key            = "server/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "lab-terraform-state-lock-table"
  }
}

