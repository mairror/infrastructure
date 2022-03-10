resource "aws_s3_bucket" "mairror_images" {
  bucket = var.mairror_bucket_name
}

resource "aws_s3_bucket_acl" "mairror_bucket_acl" {
  bucket = aws_s3_bucket.mairror_images.id
  acl    = "private"
}

resource "aws_s3_account_public_access_block" "mairror_block" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "mairror_versioning_bucket_config" {

  bucket = aws_s3_bucket.mairror_images.bucket

  rule {
    id = "raw"

    filter {
      prefix = "raw/"
    }

    noncurrent_version_transition {
      noncurrent_days = 5
      storage_class   = "INTELLIGENT_TIERING"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_notification" "mairror_bucket_notification" {
  bucket = aws_s3_bucket.mairror_images.id

  queue {
    queue_arn     = aws_sqs_queue.raw_queue.arn
    events        = ["s3:ObjectCreated:Put"]
    filter_prefix = "raw/"
  }
}
