#create s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = "queenkabalti-vaish1234"
  }

resource "aws_s3_bucket_server_side_encryption_configuration" "myencryptedbucket" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#create dynamodb table
resource "aws_dynamodb_table" "statelock" {
  name           = "vaishtable01"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

attribute {
    name = "LockID"
    type = "S"
}

}
