variable "cluster_name" {
  description = "Ім'я EKS кластера"
  type        = string
  default     = "eks-cluster"
}

variable "subnet_ids" {
  description = "Список підмереж для EKS"
  type        = list(string)
}

variable "region" {
  description = "AWS регіон для деплою"
  type        = string
  default     = "eu-central-1"
}

variable "node_group_name" {
  description = "Ім'я групи вузлів EKS"
  type        = string
  default     = "eks-node-group"
}

variable "instance_type" {
  description = "Тип екземпляра для вузлів EKS"
  type        = string
  default     = "t3.micro"
}

variable "desired_size" {
  description = "Бажаний розмір групи вузлів EKS"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Максимальний розмір групи вузлів EKS"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Мінімальний розмір групи вузлів EKS"
  type        = number
  default     = 1
}
