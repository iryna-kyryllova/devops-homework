# DevOps Homework 5

Опис проєкту:

Проєкт створює інфраструктуру на AWS за допомогою Terraform.  
Використовується підхід «Infrastructure as Code» з розбиттям на модулі.

Структура:

- s3-backend створює S3-бакет для зберігання стейтів Terraform і DynamoDB-таблицю для блокування.
- vpc створює VPC з публічними та приватними підмережами, Internet Gateway, NAT Gateway і таблицями маршрутів.
- ecr створює репозиторій Elastic Container Registry (ECR) для зберігання Docker-образів.

Ініціалізація проєкту:

```bash
terraform init
```

Перевірка плану змін:

```bash
terraform plan
```

Застосування змін:

```bash
terraform apply
```

Видалення ресурсів:

```bash
terraform destroy
```
