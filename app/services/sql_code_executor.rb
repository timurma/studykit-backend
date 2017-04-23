class SqlCodeExecutor
  attr_accessor :execution_params

  def initialize(sql_solution)
    sql_problem = sql_solution.sql_problem
    sql_params = {
      code: sql_solution.code,
      sql_problem_id: sql_solution.sql_problem_id,
      initial_code: sql_problem.initial_code,
      solution_code: sql_problem.solution_code,
      check_function: sql_problem.check_function
    }
    json_params = sql_params.to_json
    self.execution_params = json_params
  end

  def call
    # publish a message to the default exchange which then gets routed to this queue
    # persistent - save message to the disk
    queue.publish(execution_params, persistent: true)
    close_connections
  end

  private

  def queue
    # to do the things right it will be better to publish messages to exchange
    @queue ||= channel.queue('code_to_execute', durable: true, auto_delete: false)
  end

  # it is ok to have one connection per application
  # closing channel/connection after usage is a good idea
  def connection
    # amqp://guest:guest@127.0.0.1:5672
    @connection ||= Bunny.new.tap(&:start)
  end

  # channels must not be shared between threads/workers
  # each channel has a thread pool (with single thread by default)

  # if we have 2 consumers standart options use round-robing algorithm
  # to dispatch messages between consumers
  # instead of this, with prefetch = 1 we tell rabbitmq not to give
  # new messages to worker, that does not acknowledged the previous one
  # this means that message will be delivered to the next free consumers
  def channel
    @channel ||= connection.create_channel.tap { |c| c.prefetch(1) }
  end

  def close_connections
    @channel.close
    @channel = nil
    @connection.close
    @connection = nil
  end
end
