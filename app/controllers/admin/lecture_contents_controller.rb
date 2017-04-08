class LectureContentsController < Admin::ApplicationController
  before_action :set_course
  before_action :set_lecture
  before_action :set_lecture_content, only: %i(update destroy)

  def create
    lecture_content = @lecture.content.build lecture_content_params

    if lecture_content.save
      render json: lecture_content, status: :created
    else
      render json: { errors: lecture_content.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @lecture_content.update(lecture_content_params)
      render json: @lecture_content
    else
      render json: { errors: @lecture_content.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @lecture_content.destroy
    head :no_content
  end

  private

  def set_course
    @course = Course.find params[:course_id]
  end

  def set_lecture
    @lecture = @course.lectures.find params[:lecture_id]
  end

  def set_lecture_content
    @lecture_content = @lecture.content.find params[:id]
  end

  def lecture_content_params
    params.require(:lecture_content).permit(:type, :title, :body, :serial_number)
  end
end
