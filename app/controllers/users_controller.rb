class UsersController < ApplicationController
  before_action :authenticate_with_token!, only: %i(show destroy)
  before_action :set_user, only: %i(show destroy)

  def_param_group :user do
    param :user, Hash do
      param :first_name, String, required: true
      param :last_name, String, required: true
      param :email, String, required: true
      param :password, String, required: true
      param :role, %w(student admin teacher), desc: 'student if not passed'
      param :avatar, String, desc: 'base64-encoded image'
    end
  end

  api!
  example '
  {
    "id": 6,
    "first_name": "Тимур",
    "last_name": "Платонов",
    "email": "admin",
    "avatar": "http://46.101.216.31/uploads/user/avatar/4/bb3faab0-0a1c-4d9b-b1d1-e7a855f6bd5b.jpg",
    "role": "admin"
  }
  '
  example '
  {
    "errors": "Couldn\'t find User with \'id\'=2"
  }
  '
  error code: 404, desc: 'User not found'
  def show
    render json: @user, host: request.base_url
  end

  api!
  param_group :user
  example '
  {
    "user":{
      "first_name": "tim",
      "last_name": "plat",
      "email": "qwe",
      "password": "qwe"
    }
  }
  {
    "id": 8,
    "first_name": "tim",
    "last_name": "plat",
    "email": "qwe",
    "avatar": null,
    "role": "student"
  }
  '
  example '
  {
    "user":{
      "first_name": null,
      "last_name": "plat",
      "email": "qwe",
      "password": "qwe"
    }
  }
  {
    "errors": {
      "first_name": [
        "can\'t be blank"
      ],
      "email": [
        "has already been taken"
      ]
    }
  }
  '
  error code: 422, desc: 'Invalid user'
  def create
    user = User.new user_params

    if user.save
      render json: user, status: :created, host: request.base_url
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  api!
  example '
  {
    "errors": "You can delete only your own account"
  }
  '
  example '
  {
    "errors": "Couldn\'t find User with \'id\'=2"
  }
  '
  error code: 403, desc: 'You can delete only your own account'
  error code: 404, desc: 'User not found'
  def destroy
    if current_user == @user
      @user.destroy
      head :no_content
    else
      render json: { errors: 'You can delete only your own account' }, status: :forbidden
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :avatar,
                                 :role)
  end
end
