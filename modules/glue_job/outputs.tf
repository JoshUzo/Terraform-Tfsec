output "job_name" {
  description = "Name of the Glue job"
  value       = aws_glue_job.this.name
}

output "arn" {
  description = "ARN of the Glue job"
  value       = aws_glue_job.this.arn
}
