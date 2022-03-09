output "kms_key" {
  description = "KMS key arn"
  value       = aws_kms_alias.mairror_sops_alias.arn
  sensitive   = true
}
