class CourseContentsController < ApplicationController
  before_action :set_course
  before_action :set_course_content, only: %i(show update destroy)
  before_action :authenticate_with_token!, only: %i(show create update destroy)

  def_param_group :course_content do
    param :course_content, Hash do
      param :type, %w(MarkdownContent VideoContent SqlProblemContent), required: true
      param :serial_number, Integer, required: true
      param :title, String, desc: 'MarkdownContent only'
      param :body, String, desc: 'MarkdownContent only'
      param :url, String, desc: 'VideoContent only'
      param :sql_problem_id, Integer, desc: 'SqlProblemContent only'
    end
  end

  api!
  example '
  {
    "id": 8,
    "type": "SqlProblemContent",
    "course_id": 1,
    "serial_number": 111,
    "title": "Выберите всех пользователей",
    "body": "Hey, you need to select all users",
    "sql_problem_id": 1,
    "sql_solutions": [
      {
        "id": 1,
        "sql_problem_id": 1,
        "user_id": 3,
        "code": "select 1;",
        "succeed": null
      }
    ]
  }
  '
  def show
    render json: @course_content.specific
  end

  api!
  param_group :course_content
  example '
  {
    "course_content":{
      "type": "MarkdownContent"
      "serial_number": 5,
      "title": "New content",
      "body": "*md goes here*",
    }
  }
  {
    "id": 6,
    "type": "MarkdownContent",
    "course_id": 1,
    "serial_number": 5,
    "body": "New content",
    "title": "*md goes here*"
  }
  '
  error code: 403, desc: 'Do not have access to edit course'
  error code: 422, desc: 'Invalid course content'
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
