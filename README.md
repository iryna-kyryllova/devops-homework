# DevOps Homework 8-9

### Розгортання інфраструктури

У корені проєкту виконуємо команди Terraform для створення всіх необхідних сервісів:

```bash
terraform init
terraform plan
terraform apply
```

### Перевірити Jenkins job

Увійти в Jenkins та виконати pipeline з Jenkinsfile або з CLI виконати:

```bash
jenkins-cli build my-pipeline -s
```

В результаті збирається Docker-образ, пушиться в ECR і оновлюється тег у Helm chart.

### Побачити результат в Argo CD

Увійти в Argo CD та переконатися, що застосунок у стані Synced/Healthy.
Також можна перевірити командою:

```bash
kubectl get svc -n django
```
