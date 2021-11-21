# SSE-KMS 
resource "aws_kms_key" "week12-kms-v2" {}

resource "aws_kms_alias" "week12-kms-v2" {
  name          = "alias/week12-kms-v2"
  target_key_id = aws_kms_key.week12-kms-v2.key_id
}
