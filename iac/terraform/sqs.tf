resource "aws_sqs_queue" "raw_queue" {
  name                              = var.raw_queue_name
  delay_seconds                     = 2
  max_message_size                  = 2048
  message_retention_seconds         = 86400
  receive_wait_time_seconds         = 10
  kms_master_key_id                 = aws_kms_alias.mairror_sops_alias.name
  kms_data_key_reuse_period_seconds = 300
  policy                            = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:${var.raw_queue_name}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.mairror_images.arn}" }
      }
    }
  ]
}
POLICY
}

resource "aws_sqs_queue" "predict_queue" {
  name                              = var.predict_queue_name
  delay_seconds                     = 2
  max_message_size                  = 2048
  message_retention_seconds         = 86400
  receive_wait_time_seconds         = 10
  kms_master_key_id                 = aws_kms_alias.mairror_sops_alias.name
  kms_data_key_reuse_period_seconds = 300
}
