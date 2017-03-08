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
        "avatar": <- multipart data
    }
}

```

