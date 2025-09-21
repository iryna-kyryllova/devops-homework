# DevOps Final Project

Проєкт реалізує **production-ready DevOps інфраструктуру** з повним CI/CD pipeline'ом.

### Архітектура

- Terraform (Infrastructure)
- AWS (VPC, EKS, RDS, ECR)
- Jenkins (CI)
- Argo CD (CD)
- Prometheus
- Grafana (Monitoring)

### Структура проєкту

```
Project/
│
├── main.tf                      # Головний файл для підключення модулів
├── backend.tf                   # Налаштування бекенду для стейтів (S3 + DynamoDB)
├── outputs.tf                   # Загальні виводи ресурсів
│
├── modules/                     # Каталог з усіма модулями
│  ├── s3-backend/               # Модуль для S3 та DynamoDB
│  │  ├── s3.tf                  # Створення S3-бакета
│  │  ├── dynamodb.tf            # Створення DynamoDB
│  │  ├── variables.tf           # Змінні для S3
│  │  └── outputs.tf             # Виведення інформації про S3 та DynamoDB
│  │
│  ├── vpc/                      # Модуль для VPC
│  │  ├── vpc.tf                 # Створення VPC, підмереж, Internet Gateway
│  │  ├── routes.tf              # Налаштування маршрутизації
│  │  ├── variables.tf           # Змінні для VPC
│  │  └── outputs.tf  
│  ├── ecr/                      # Модуль для ECR
│  │  ├── ecr.tf                 # Створення ECR репозиторію
│  │  ├── variables.tf           # Змінні для ECR
│  │  └── outputs.tf             # Виведення URL репозиторію
│  │
│  ├── eks/                      # Модуль для Kubernetes кластера
│  │  ├── eks.tf                 # Створення кластера
│  │  ├── aws_ebs_csi_driver.tf  # Встановлення плагіну csi drive
│  │  ├── variables.tf           # Змінні для EKS
│  │  └── outputs.tf             # Виведення інформації про кластер
│  │
│  ├── rds/                      # Модуль для RDS
│  │  ├── rds.tf                 # Створення RDS бази даних
│  │  ├── aurora.tf              # Створення aurora кластера бази даних
│  │  ├── shared.tf              # Спільні ресурси
│  │  ├── variables.tf           # Змінні (ресурси, креденшели, values)
│  │  └── outputs.tf  
│  │ 
│  ├── jenkins/                  # Модуль для Helm-установки Jenkins
│  │  ├── jenkins.tf             # Helm release для Jenkins
│  │  ├── variables.tf           # Змінні (ресурси, креденшели, values)
│  │  ├── providers.tf           # Оголошення провайдерів
│  │  ├── values.yaml            # Конфігурація jenkins
│  │  └── outputs.tf             # Виводи (URL, пароль адміністратора)
│  │ 
│  └── argo_cd/                  # Модуль для Helm-установки Argo CD
│    ├── jenkins.tf              # Helm release для Jenkins
│    ├── variables.tf            # Змінні (версія чарта, namespace, repo URL тощо)
│    ├── providers.tf            # Kubernetes+Helm
│    ├── values.yaml             # Кастомна конфігурація Argo CD
│    ├── outputs.tf              # Виводи (hostname, initial admin password)
│		  └──charts/                 # Helm-чарт для створення app'ів
│ 	 	  ├── Chart.yaml
│	 	  ├── values.yaml            # Список applications, repositories
│			  └── templates/
│		    ├── application.yaml
│		    └── repository.yaml
├── charts/
│  └── django-app/
│    ├── templates/
│    │  ├── deployment.yaml
│    │  ├── service.yaml
│    │  ├── configmap.yaml
│    │  └── hpa.yaml
│    ├── Chart.yaml
│    └── values.yaml             # ConfigMap зі змінними середовища
└──Django
			 ├── app\
			 ├── Dockerfile
			 ├── Jenkinsfile
			 └── docker-compose.yaml

```

### Розгортання інфраструктури Terraform

```bash
# Ініціалізація
terraform init

# Планування
terraform plan

# Застосування
terraform apply
```

### Налаштування kubectl

```bash
# Отримати конфігурацію для підключення до EKS
aws eks --region eu-central-1 update-kubeconfig \
  --name $(terraform output -raw eks_cluster_name)

# Перевірити підключення
kubectl get nodes
```

### Jenkins

```bash
# Отримати URL Jenkins
kubectl get svc -n jenkins jenkins

# Отримати пароль адміністратора
kubectl get secret -n jenkins jenkins -o jsonpath={.data.jenkins-admin-password} | base64 -d
```

### ArgoCD

```bash
# Отримати початковий пароль
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath={.data.password} | base64 -d

# Port forward для доступу
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

### Prometheus

```bash
# Отримати URL
kubectl get svc -n monitoring prometheus-server
# Або через terraform output
terraform output prometheus_url
```

### Grafana

```bash
# Отримати URL
kubectl get svc -n monitoring grafana
terraform output grafana_url

# Отримати пароль адміністратора
terraform output grafana_admin_password
```

### Моніторинг

**Prometheus Metrics:**

- Kubernetes кластер метрики
- Node metрики (CPU, Memory, Network)
- Pod метрики
- Custom application метрики

**Grafana Dashboards:**

- Kubernetes Cluster Overview
- Node Monitoring
- Application Metrics
- Database Monitoring

### Безпека

- **Network Security**: VPC з приватними підмережами
- **Access Control**: IAM ролі з мінімальними правами
- **Secrets Management**: Kubernetes secrets
- **Database Security**: RDS в приватній мережі
- **Container Security**: ECR image scanning
- **Network Policies**: Kubernetes network policies
