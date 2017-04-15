class UsersController < ApplicationController
  before_action :set_user, only: %i(show)

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

  private

  def set_user
    @user = User.find params[:id]
  end
end
