class CodeExecutor
  attr_accessor :code_to_execute

  # it is ok to have one connection per application
  # closing channel/connection after usage is a good idea
  def self.connection
    # amqp://guest:guest@127.0.0.1:5672
    @connection ||= Bunny.new.tap(&:start)
  end

  def initialize(code_to_execute)
    self.code_to_execute = code_to_execute
  end

  def perform
    # publish a message to the default exchange which then gets routed to this queue
    # persistent - save message to the disk
    queue.publish(code_to_execute, persistent: true)

    # TODO: probably close channel here
  end

  # def recieve
  #   # we provide a callback that will be executed
  #   # when RabbitMQ pushes messages to our consumer.
  #   # This is what Bunny::Queue#subscribe does.
  #
  #   # Bunny::Queue#subscribe is used with the :block option
  #   # that makes it block the calling thread (we don't want the script to finish running immediately!).
  #
  #   # manual_ack - consumer said that message was correctly processed
  #   # otherwise rabbitmq sends message to the next consumer
  #   q.subscribe(manual_ack: true, block: true) do |delivery_info, _properties, body|
  #     puts " [x] Received #{body}"
  #
  #     channel.ack(delivery_info.delivery_tag)
  #   end
  # end

  private

  def queue
    # to do the things right it will be better to publish messages to exchange
    @queue ||= channel.queue('code_to_execute', durable: true, auto_delete: false)
  end

  # channels must not be shared between threads/workers
  # each channel has a thread pool (with single thread by default)

  # if we have 2 consumers standart options use round-robing algorithm
  # to dispatch messages between consumers
  # instead of this, with prefetch = 1 we tell rabbitmq not to give
  # new messages to worker, that does not acknowledged the previous one
  # this means that message will be delivered to the next free consumers
  def channel
    @channel ||= CodeExecutor.connection.create_channel.tap { |c| c.prefetch(1) }
  end
end
