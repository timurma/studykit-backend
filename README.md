# README

### Курсы
___


#### Список курсов

```
GET /courses.json
```

#### Информация о курсе

```
GET /courses/1.json
```

#### Создание курса

```
POST /courses.json
{
    "course":{
        "title": "Вводный курс в Phoenix",
        "description": "Сделаем простой hello-world проект",
        "owner_id": 1, <- user_id
        "avatar": <- multipart data; optional
    }
}

```


### Установка RabbitMQ

---

0. В системе должен быть установлен *Erlang OTP*
1. Добавляем источник для *apt* и ставим пакет **rabbitmq-server**
2. ```sudo rabbitmq-plugins enable rabbitmq_management```
3. ```sudo rabbitmq-plugins enable rabbitmq_management_visualiser```
4. http://localhost:15672/
