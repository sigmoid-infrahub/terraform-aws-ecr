locals {
  sigmoid_tags = merge(
    var.sigmoid_environment != "" ? { "sigmoid:environment" = var.sigmoid_environment } : {},
    var.sigmoid_project != "" ? { "sigmoid:project" = var.sigmoid_project } : {},
    var.sigmoid_team != "" ? { "sigmoid:team" = var.sigmoid_team } : {},
  )


  resolved_tags = merge({
    ManagedBy = "sigmoid"
  }, var.tags, local.sigmoid_tags)

  should_create_default_lifecycle_policy = (
    var.create_lifecycle_policy &&
    var.default_lifecycle_policy_enabled &&
    var.lifecycle_policy == null
  )

  default_lifecycle_policy = {
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images after ${var.expire_untagged_after_days} days"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = var.expire_untagged_after_days
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Retain latest ${var.retain_latest_tagged_count} tagged images"
        selection = {
          tagStatus      = "tagged"
          tagPatternList = ["*"]
          countType      = "imageCountMoreThan"
          countNumber    = var.retain_latest_tagged_count
        }
        action = {
          type = "expire"
        }
      }
    ]
  }

  resolved_lifecycle_policy = var.lifecycle_policy == null ? local.default_lifecycle_policy : var.lifecycle_policy
}
