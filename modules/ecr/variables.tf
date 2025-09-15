variable "repository_name" {
  description = "Назва репозиторію ECR"
  type        = string
}

variable "image_tag_mutability" {
  description = "MUTABLE або IMMUTABLE для незмінних тегів"
  type        = string
  default     = "MUTABLE"
}

variable "force_delete" {
  description = "Видаляти образи при знищенні бакета"
  type        = bool
  default     = true
}

variable "image_scan_on_push" {
  description = "Сканувати образи на вразливості при пуші"
  type        = bool
  default     = true
}

variable "repository_policy" {
  description = "Кастомна JSON-політика для репозиторію ECR"
  type        = string
  default     = null
}
