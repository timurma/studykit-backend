class SessionsController < ApplicationController
  def_param_group :user do
    param :user, Hash, desc: 'User login info', required: true do
      param :email, String, desc: 'Email for login', required: true
      param :password, String, desc: 'Password for login', required: true
    end
  end

  api!
  param_group :user
  example '
  {
    "user": {
      "email": "tpltn",
      "password": "password"
    }
  }
  {
    "id": 3,
    "first_name": "tim",
    "last_name": "plat",
    "email": "tpltn",
    "avatar": null,
    "role": "teacher",
    "jwt_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0OTI1MzU5MjV9.LlADZ2zGNu8wfeN8w0Y8bC6Xby_YUh4KVo1CnPTo_Nc"
  }
  '
  example '
  {
    "user": {
      "email": "tpltn",
      "password": "123"
    }
  }
  {
    "errors": "User with specified credentials not found"
  }
  '
  error code: 404, desc: 'User with specified credentials not found'
  def create
    user = User.find_by_email_password(login_params[:email], login_params[:password])

    if user
      token = user.issue_token
      render json: user, jwt_token: token
    else
      render json: { errors: 'User with specified credentials not found' }, status: :not_found
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
