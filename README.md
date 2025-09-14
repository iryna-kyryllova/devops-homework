# DevOps Homework 4

Dockerized Django-проєкт з базою даних PostgreSQL та вебсервером Nginx.

Сервіси:

- web: Django-застосунок
- db: PostgreSQL
- nginx: вебсервер-проксі

Запуск проєкту локально:

```bash
docker compose build
docker compose run --rm web django-admin startproject config .
docker compose run --rm web python manage.py migrate
docker compose up -d
```

Перевірка:
http://localhost - стартова сторінка Django
