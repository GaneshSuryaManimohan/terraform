terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.50.0"
      }
    }
    backend "s3" {
    bucket = "surya-devops-remote-state"
    key    = "remote-state"
    region = "us-east-1"
    dynamodb_table = "remote-state-lock"
    }
  }
    
  provider "aws" {
    region = "us-east-1"
  }