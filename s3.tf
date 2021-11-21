# S3 bucket 
resource "aws_s3_bucket" "ece592-week12-brando" {
  bucket = "ece592-week12-brando"
  acl    = "private"

  tags = {
    Name = "ece592-week12-brando"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
    tags    = {}

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.week12-kms-v2.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_lambda_permission" "week12-bucket-lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.ece592-week12-brando.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.ece592-week12-brando.id

  lambda_function {
  lambda_function_arn  = aws_lambda_function.lambda.arn 
   events              = ["s3:ObjectCreated:*"]
  }
}
