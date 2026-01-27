output "repository_url" {
  description = "Repository URL"
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "Repository ARN"
  value       = aws_ecr_repository.this.arn
}

output "module" {
  description = "Full module outputs"
  value = {
    repository_url = aws_ecr_repository.this.repository_url
    repository_arn = aws_ecr_repository.this.arn
  }
}
