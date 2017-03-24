class LecturesController < ApplicationController
  before_action :set_course
  before_action :authenticate_with_token!, only: [:create]

  def index
    render json: @course.lectures.order(:serial_number)
  end

  def create
    lecture = @course.lectures.build lecture_params
    authorize!(:create, lecture)

    if lecture.save
      render json: lecture, status: :created
    else
      render json: { errors: lecture.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_course
    @course = Course.find params[:course_id]
  end

  def lecture_params
    params.require(:lecture).permit(:title, :course_id, :serial_number)
  end
end
