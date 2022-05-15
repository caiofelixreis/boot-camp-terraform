provider "aws" {
  profile = "default"
  region  = var.aws_default_region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-felix"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}