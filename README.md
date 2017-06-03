# README

### Установка RabbitMQ

---

0. В системе должен быть установлен *Erlang OTP*
1. Добавляем источник для *apt* и ставим пакет **rabbitmq-server**
2. ```sudo rabbitmq-plugins enable rabbitmq_management```
3. ```sudo rabbitmq-plugins enable rabbitmq_management_visualiser```
4. http://localhost:15672/


### Запуск Sneakers Worker

---

Для обмена сообщениями между *executor* и *backend* нужно выполнить:
```WORKERS=SolutionUpdater bundle exec rake sneakers:run```


### ImageMagick для конвертации картинок

```sudo apt install imagemagick```
