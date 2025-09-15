variable "bucket_name" {
  description = "Назва бакету для зберігання terraform state"
  type        = string
}

variable "table_name" {
  description = "Назва таблиці для блокування стейтів"
  type        = string
}
