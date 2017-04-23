class SolutionUpdater
  include Sneakers::Worker
  from_queue 'code_to_execute'

  def work(message)
    Sneakers.logger.info message
    ack!
  end
end
