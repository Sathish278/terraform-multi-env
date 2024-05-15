terraform {
  backend "s3" {
    bucket         = "sathish-s3-demo-prod" # change this
    key            = "multi-env-tfvars"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-prod"
  }
}