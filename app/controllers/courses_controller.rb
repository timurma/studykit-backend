class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  before_action :try_set_owner, only: [:index]

  def index
    @courses = Course.all
    @courses = @owner.owned_courses if @owner
    render json: @courses.includes(:content).order(updated_at: :desc), host: request.base_url
  end

  def show
    render json: @course, host: request.base_url
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

  def try_set_owner
    @owner = User.find_by(id: params[:user_id])
  end
end
