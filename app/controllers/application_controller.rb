class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  protected

  def render_not_found(errors)
    render json: { errors: errors }, status: :not_found
  end
end
