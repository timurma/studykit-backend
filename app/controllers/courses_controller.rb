class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    render json: Course.order(updated_at: :desc), host: request.base_url
  end

  def show
    render json: @course, host: request.base_url
  end

  private

  def set_course
    @course = Course.find params[:id]
  end
end
