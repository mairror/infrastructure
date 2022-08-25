resource "aws_s3_bucket" "mairror_images" {
  #checkov:skip=CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"
  bucket = var.mairror_bucket_name
}

resource "aws_s3_bucket_acl" "mairror_bucket_acl" {
  bucket = aws_s3_bucket.mairror_images.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "mairror_block" {
  bucket                  = aws_s3_bucket.mairror_images.id
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

resource "aws_s3_bucket_versioning" "mairror_bucket_versioning" {
  bucket = aws_s3_bucket.mairror_images.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_public_access_block" "mairror_bucket_block_public_acls" {
  bucket = aws_s3_bucket.mairror_images.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "mairror_sse_kms" {
  bucket = aws_s3_bucket.mairror_images.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mairror_sops.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
