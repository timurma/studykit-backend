class LecturesController < ApplicationController
  before_action :set_course

  def index
    render json: @course.lectures.order(:serial_number)
  end

  private

  def set_course
    @course = Course.find params[:course_id]
  end
end
