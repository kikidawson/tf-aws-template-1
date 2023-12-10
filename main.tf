resource "aws_kms_key" "this" {
  #checkov:skip=CKV_AWS_7, CKV2_AWS_64

  description             = "This key is used to encrypt bucket objects."
  deletion_window_in_days = 10
}

module "s3" {
  #checkov:skip=CKV2_AWS_61, CKV_AWS_18, CKV2_AWS_65, CKV2_AWS_62, CKV_AWS_144, CKV2_AWS_64

  source = "git::https://github.com/kikidawson/tf-aws-module-s3.git?ref=main"

  name        = "tester-${data.aws_caller_identity.current.account_id}"
  kms_key_arn = aws_kms_key.this.arn
}
