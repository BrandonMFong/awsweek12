# Week 12
resource "aws_sns_topic" "week12-sns" {
  name              = "week12-sns"
  kms_master_key_id = "ECE592"
}

