provider "aws" {
  region  = "ap-northeast-1"
  profile = "base-education-terraform"
}

terraform {
  required_version = "~> 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }
  }
  backend "s3" {
    bucket  = "base-education-terraform-tfstate"
    key     = "satsuki-watabe.tfstate"
    region  = "ap-northeast-1"
    profile = "base-education-terraform"
  }
}
