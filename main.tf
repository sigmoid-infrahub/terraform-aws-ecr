resource "aws_ecr_repository" "this" {
  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key
  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = local.resolved_tags
}

resource "aws_ecr_lifecycle_policy" "this" {
  count = var.lifecycle_policy == null ? 0 : 1

  repository = aws_ecr_repository.this.name
  policy     = jsonencode(var.lifecycle_policy)
}

resource "aws_ecr_repository_policy" "this" {
  count = var.repository_policy == null ? 0 : 1

  repository = aws_ecr_repository.this.name
  policy     = jsonencode(var.repository_policy)
}
