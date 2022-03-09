resource "aws_kms_key" "mairror_sops" {
  description             = "Sops kms key to encrypt secrets"
  deletion_window_in_days = 7
}

resource "aws_kms_alias" "mairror_sops_alias" {
  name          = "alias/mairror-sops"
  target_key_id = aws_kms_key.mairror_sops.key_id
}
