resource "aws_cloudwatch_log_group" "fiboseq_log_group" {
  name              = "/ecs/fiboseq-app"
  retention_in_days = 30

  tags = {
    Name = "fiboseq-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "fiboseq_log_stream" {
  name           = "cb-log-stream"
  log_group_name = aws_cloudwatch_log_group.fiboseq_log_group.name
}