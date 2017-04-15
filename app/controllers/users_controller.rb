class UsersController < ApplicationController
  before_action :set_user, only: %i(show)

  def show
    render json: @user, host: request.base_url
  end

  private

  def set_user
    @user = User.find params[:id]
  end
end
