class SolutionUpdater
  include Sneakers::Worker
  from_queue 'code_to_execute'

  def work(message)
    puts message
    ack!
  end
end
