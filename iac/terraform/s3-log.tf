
#tfsec:ignore:aws-s3-enable-versioning
#tfsec:ignore:aws-s3-enable-bucket-encryption
resource "aws_s3_bucket" "log_bucket" {
  #checkov:skip=CKV_AWS_145: "Ensure that S3 buckets are encrypted with KMS by default"
  #checkov:skip=CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
  bucket = "my-tf-log-bucket"
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_public_access_block" "log_bucket_block" {
  bucket                  = aws_s3_bucket.log_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "log_bucket_logging" {
  bucket = aws_s3_bucket.mairror_images.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}
