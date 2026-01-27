variable "repository_name" {
  type        = string
  description = "ECR repository name"
}

variable "image_tag_mutability" {
  type        = string
  description = "Image tag mutability"
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  type        = bool
  description = "Scan on push"
  default     = true
}

variable "encryption_type" {
  type        = string
  description = "Encryption type"
  default     = "AES256"
}

variable "kms_key" {
  type        = string
  description = "KMS key ARN"
  default     = null
}

variable "force_delete" {
  type        = bool
  description = "Force delete repository"
  default     = false
}

variable "create_lifecycle_policy" {
  type        = bool
  description = "Create lifecycle policy"
  default     = true
}

variable "lifecycle_policy" {
  type        = any
  description = "Lifecycle policy JSON"
  default     = null
}

variable "repository_policy" {
  type        = any
  description = "Repository policy JSON"
  default     = null
}

variable "repository_read_access_arns" {
  type        = list(string)
  description = "Read access ARNs"
  default     = []
}

variable "repository_read_write_access_arns" {
  type        = list(string)
  description = "Read/write access ARNs"
  default     = []
}

variable "repository_lambda_read_access_arns" {
  type        = list(string)
  description = "Lambda read access ARNs"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}
