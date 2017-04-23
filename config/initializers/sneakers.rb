Sneakers.configure(amqp: "amqp://#{ENV['RABBITMQ_USER']}:#{ENV['RABBITMQ_PASS']}@#{ENV['RABBITMQ_HOST']}:5672",
                   prefetch: 1,
                   workers: 1,
                   daemonize: true,
                   threads: 1)

Sneakers.logger.level = Logger::INFO
