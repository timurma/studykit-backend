class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from CanCan::AccessDenied, with: :render_forbidden

  protected

  def render_not_found(errors)
    render json: { errors: errors }, status: :not_found
  end

  def render_forbidden(errors)
    render json: { errors: errors }, status: :forbidden
  end
end
