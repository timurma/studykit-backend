class Admin::CourseContentsController < Admin::ApplicationController
  before_action :set_course_content, only: %i(show update destroy)

  def index
    render json: CourseContent.order(updated_at: :desc).map(&:specific)
  end

  def show
    render json: @course_content.specific
  end

  def create
    course_content = CourseContent.build_specific course_content_params

    if course_content.save
      render json: course_content, status: :created
    else
      render json: { errors: course_content.errors }, status: :unprocessable_entity
    end
  end

  def update
    @course_content = @course_content.specific
    if @v_content.update(course_content_params)
      render json: @course_content
    else
      render json: { errors: @course_content.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @course_content.destroy
    head :no_content
  end

  private

  def set_course_content
    @course_content = CourseContent.find params[:id]
  end

  def course_content_params
    params.require(:course_content).permit(:course_id, :type, :serial_number,
                                           :title, :body,
                                           :url)
  end
end
