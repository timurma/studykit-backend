class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from CanCan::AccessDenied, with: :render_forbidden
  rescue_from ActionController::ParameterMissing, with: :render_bad_request

  protected

  def render_not_found(errors)
    render json: { errors: errors }, status: :not_found
  end

  def render_forbidden(errors)
    render json: { errors: errors }, status: :forbidden
  end

  def render_bad_request(errors)
    render json: { errors: errors }, status: :bad_request
  end
end
