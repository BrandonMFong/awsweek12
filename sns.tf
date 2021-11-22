# Week 12
resource "aws_sns_topic" "week12-sns" {
  name              = "week12-sns"
  kms_master_key_id = "ECE592"
}

resource "aws_sns_topic_subscription" "week12-sns-mail" {
  topic_arn = aws_sns_topic.week12-sns.id
  protocol  = "email"
  endpoint  = "fong.m.brandon97@gmail.com"
}

