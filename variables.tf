variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-central-1"
}

variable "db_name" {
  description = "Name of the DB"
  type        = string
  default     = "lesson7db"
}

variable "db_user" {
  description = "Name of the DB user"
  type        = string
  default     = "lesson7user"
}

variable "db_password" {
  description = "DB password"
  type        = string
  default     = "admin123"
}
