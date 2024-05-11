resource "aws_instance" "expense" {
    for_each = var.instance_names # each.key and each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-08bef055e77f836f7"] # replace with you SG ID
    instance_type = each.value
    tags = merge(
        var.common_tags,
        {
            Name = "${each.key}"
            Module = "${each.key}"
            Environment = var.environment
        }
    )
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "sathish-s3-demo-dev" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-dev"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "sathish-s3-demo-prod" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-prod"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}