output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
  description = "Endpoint of the RDS instance"
}

