module Authenticable
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= User.find_by_token(token)
  end

  def token
    request.headers['Authorization']
  end

  def authenticate_with_token!
    render json: { errors: 'Not authenticated' }, status: :unauthorized unless current_user
  end

  def reject_non_admins!
    render json: { errors: 'Forbidden' }, status: :forbidden unless current_user&.admin?
  end
end
