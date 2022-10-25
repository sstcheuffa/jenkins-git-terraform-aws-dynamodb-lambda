resource "aws_s3_bucket" "bucket" {
  bucket              = "terraform-aws-jenkins-git-lambda-dynamodb-s3-state-backend"
  object_lock_enabled = "true"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

