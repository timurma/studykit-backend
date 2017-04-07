class Admin::LecturesController < Admin::ApplicationController
  before_action :set_course
  before_action :set_lecture, only: %i(show update destroy)

  def index
    render json: @course.lectures.order(:serial_number)
  end

  def show
    render json: @lecture
  end

  def create
    lecture = @course.lectures.build lecture_params

    if lecture.save
      render json: lecture, status: :created
    else
      render json: { errors: lecture.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @lecture.update(lecture_params)
      render json: @lecture
    else
      render json: { errors: @lecture.errors }, status: :unprocessable_entity
    end
  end

  def destroy
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
    params.require(:lecture).permit(:title, :serial_number)
  end
end
