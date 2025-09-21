# DevOps Homework 7

### Створення кластера EKS і необхідних ресурсів

```bash
terraform init
terraform plan
terraform apply
```

### Підготовка Docker-образу

Перейти в директорію з проєктом (тема 4), де лежить Dockerfile, та виконати:

```bash
docker build -t django-app:latest .
docker tag django-app:latest 110427924065.dkr.ecr.eu-central-1.amazonaws.com/lesson-5-ecr:latest
docker push 110427924065.dkr.ecr.eu-central-1.amazonaws.com/lesson-5-ecr:latest
```

### Деплой Django у кластері

Перейти в директорію з чартом та виконати:

```bash
helm upgrade --install django . -n django --create-namespace -f values.yaml
```

### Перевірка

Подивитися статус подів:

```bash
kubectl get pods -n django
```

Подивитися LoadBalancer:

```bash
kubectl get svc -n django
```

Отриманий EXTERNAL-IP можна відкрити у браузері.
