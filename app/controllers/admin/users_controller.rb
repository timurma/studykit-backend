class Admin::UsersController < Admin::ApplicationController
  def index
    render json: User.order(updated_at: :desc)
  end

  def create
    user = User.new user_params

    if user.save
      render json: user, status: :created, host: request.base_url
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :avatar,
                                 :role)
  end
end
