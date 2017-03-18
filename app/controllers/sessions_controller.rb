class SessionsController < ApplicationController
  def create
    user = User.find_by_email_password(login_params[:email], login_params[:password])

    if user
      token = user.issue_token
      render json: { auth_token: token }
    else
      render json: { errors: 'Invalid credentials' }, status: :not_found
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
