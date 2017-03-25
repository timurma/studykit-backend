class LecturesController < ApplicationController
  before_action :set_course
  before_action :set_lecture, only: %i(show update destroy)
  before_action :authenticate_with_token!, only: [:create]

  def index
    render json: @course.lectures.order(:serial_number)
  end

  def show
    render json: @lecture
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

  def update
    authorize!(:update, @lecture)

    if @lecture.update(lecture_update_params)
      render json: @lecture
    else
      render json: { errors: @lecture.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize!(:destroy, @lecture)
    @lecture.destroy
    head :no_content
  end

  private

  def set_course
    @course = Course.find params[:course_id]
  end

  def set_lecture
    @lecture = @course.lectures.find params[:id]
  end

  def lecture_params
    params.require(:lecture).permit(:title, :course_id, :serial_number)
  end

  def lecture_update_params
    params.require(:lecture).permit(:title, :serial_number)
  end
end
