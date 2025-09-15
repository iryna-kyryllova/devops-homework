output "s3_bucket_name" {
  description = "Назва S3-бакета для стейтів"
  value       = module.s3_backend.s3_bucket_name
}

output "s3_bucket_url" {
  description = "URL S3-бакета для стейтів"
  value       = module.s3_backend.s3_bucket_url
}

output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Приватні підмережи"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Публічні підмережи"
  value       = module.vpc.public_subnets
}

output "ecr_repository_url" {
  description = "URL репозиторію"
  value       = module.ecr.ecr_repository_url
}