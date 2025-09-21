# DevOps Homework 10 (db-module)

### Розгортання інфраструктури

У корені проєкту виконуємо команди Terraform для створення всіх необхідних сервісів:

```bash
terraform init
terraform plan
terraform apply
```

### Terraform RDS Модуль

Універсальний модуль для створення баз даних у AWS:

- стандартний RDS (PostgreSQL/MySQL);
- Aurora Cluster (PostgreSQL/MySQL) при `use_aurora = true`.

**Змінні:**

| Змінна                        | Тип          | Значення за замовчуванням | Опис                                                  |
| ----------------------------- | ------------ | ------------------------- | ----------------------------------------------------- |
| name                          | string       | —                         | Назва інстансу або кластера                           |
| use_aurora                    | bool         | false                     | Використати Aurora (true) або стандартний RDS (false) |
| db_name                       | string       | bd_rds                    | Назва бази даних                                      |
| username                      | string       | —                         | Master username                                       |
| password                      | string       | —                         | Master password (sensitive)                           |
| engine                        | string       | postgres                  | Драйвер для RDS (postgres/mysql)                      |
| engine_version                | string       | 14.19                     | Версія RDS (Postgres/MySQL)                           |
| engine_cluster                | string       | aurora-postgresql         | Драйвер для Aurora                                    |
| engine_version_cluster        | string       | 15.14                     | Версія Aurora                                         |
| instance_class                | string       | db.t3.medium              | Клас інстансу                                         |
| allocated_storage             | number       | 20                        | Обсяг сховища (тільки для RDS)                        |
| multi_az                      | bool         | false                     | Чи розгортати у Multi-AZ                              |
| publicly_accessible           | bool         | false                     | Доступність з інтернету                               |
| backup_retention_period       | number       | 7                         | Днів збереження бекапів                               |
| aurora_replica_count          | number       | 1                         | Кількість реплік Aurora                               |
| vpc_id                        | string       | —                         | VPC ID                                                |
| vpc_cidr_block                | string       | 10.0.0.0/16               | CIDR блок для VPC                                     |
| subnet_private_ids            | list(string) | —                         | ID приватних підмереж                                 |
| subnet_public_ids             | list(string) | —                         | ID публічних підмереж                                 |
| parameter_group_family_rds    | string       | postgres15                | Параметри для RDS                                     |
| parameter_group_family_aurora | string       | aurora-postgresql15       | Параметри для Aurora                                  |
| parameters                    | map(string)  | {}                        | Кастомні параметри (наприклад max_connections)        |
| tags                          | map(string)  | {}                        | Теги ресурсів                                         |
| environment                   | string       | dev                       | Середовище (dev/stage/prod)                           |
| project                       | string       | goit                      | Назва проєкту                                         |

**Перемикання між Aurora та RDS:**

- use_aurora = false → створюється звичайний RDS instance;
- use_aurora = true → створюється Aurora cluster з writer + reader(s).
