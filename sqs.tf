resource "aws_sqs_queue" "week12-sqs" {
  name                      = "week12-sqs"
  delay_seconds             = 0
  max_message_size          = 1024
  message_retention_seconds = 3600
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
  }
}
