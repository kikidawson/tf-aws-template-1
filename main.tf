resource "aws_kms_key" "this" {
  description             = "This key is used to encrypt bucket objects."
  deletion_window_in_days = 10
}

module "s3" {
  source = "https://github.com/kikidawson/tf-aws-module-s3.git?ref=main"

  name        = "tester-${data.aws_caller_identity.current.account_id}"
  kms_key_arn = aws_kms_key.this.arn
}
