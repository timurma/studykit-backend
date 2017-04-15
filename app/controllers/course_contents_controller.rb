class CourseContentsController < ApplicationController
  before_action :set_course
  before_action :set_course_content, only: %i(update destroy)
  before_action :authenticate_with_token!, only: %i(create update destroy)

  def create
    course_content = @course.content.build_specific course_content_params
    authorize!(:create, course_content)

    if course_content.save
      render json: course_content, status: :created
    else
      render json: { errors: course_content.errors }, status: :unprocessable_entity
    end
  end

  def update
    @course_content = @course_content.specific
    authorize!(:update, @course_content)

    if @course_content.update(course_content_params)
      render json: @course_content
    else
      render json: { errors: @course_content.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize!(:destroy, @course_content)
    @course_content.destroy
    head :no_content
  end

  private

  def set_course
    @course = Course.find params[:course_id]
  end

  def set_course_content
    @course_content = @course.content.find params[:id]
  end

  def course_content_params
    params.require(:course_content).permit(:type, :serial_number,
                                           :title, :body,
                                           :url)
  end
end
