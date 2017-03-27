class CodeExecutorController < ApplicationController
  def execute
    x = 'hello' || params[:code]
    CodeExecutor.new(x).perform
    render json: { ok: x }
  end
end
