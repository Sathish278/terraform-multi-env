terraform {
  backend "s3" {
    bucket         = "Sathish-s3-demo-dev" # change this
    key            = "multi-env-tfvars"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}