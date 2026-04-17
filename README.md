# Module: ECR

This module manages an Amazon Elastic Container Registry (ECR) repository, including lifecycle policies and access permissions.

## Features
- ECR Repository creation
- Image tag mutability and Scan on Push configuration
- AES256 or KMS encryption
- Lifecycle policy management
- Granular repository policy for ARNs (Read, Write, Lambda)
- Force delete option

## Usage
```hcl
module "ecr" {
  source = "../../terraform-modules/terraform-aws-ecr"

  repository_name = "my-app"
}
```

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `repository_name` | `string` | n/a | ECR repository name |
| `image_tag_mutability` | `string` | `"IMMUTABLE"` | Image tag mutability |
| `scan_on_push` | `bool` | `true` | Scan on push |
| `encryption_type` | `string` | `"AES256"` | Encryption type |
| `kms_key` | `string` | `null` | KMS key ARN |
| `force_delete` | `bool` | `false` | Force delete repository |
| `create_lifecycle_policy` | `bool` | `true` | Create lifecycle policy |
| `lifecycle_policy` | `any` | `null` | Lifecycle policy JSON |
| `repository_policy` | `any` | `null` | Repository policy JSON |
| `repository_read_access_arns` | `list(string)` | `[]` | Read access ARNs |
| `repository_read_write_access_arns` | `list(string)` | `[]` | Read/write access ARNs |
| `repository_lambda_read_access_arns` | `list(string)` | `[]` | Lambda read access ARNs |
| `tags` | `map(string)` | `{}` | Tags to apply |

## Outputs
| Name | Description |
|------|-------------|
| `repository_url` | Repository URL |
| `repository_arn` | Repository ARN |
| `module` | Full module outputs |

## Environment Variables
None

## Notes
- Lifecycle policies help manage storage costs by automatically expiring old images.
- Use `force_delete` with caution as it will delete the repository even if it contains images.
