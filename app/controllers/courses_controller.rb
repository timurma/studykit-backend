class CoursesController < ApplicationController
  has_scope :owned_by, only: :index
  has_scope :participated_by, only: :index

  before_action :set_course, only: %i(show update destroy join leave participating)
  before_action :authenticate_with_token!, only: %i(create update destroy join leave participating)

  def_param_group :course do
    param :course, Hash do
      param :title, String, required: true
      param :description, String, required: true
      param :avatar, String, desc: 'base64 encoded image'
    end
  end

  api!
  param :owned_by, Integer, desc: 'Owner id'
  param :participated_by, Integer, desc: 'Student id'
  example '/courses?owned_by=1'
  example '/courses?owned_by=1&participated_by=5'
  def index
    @courses = apply_scopes(Course).includes(:owner, :lectures)
    render json: @courses.order(updated_at: :desc), host: request.base_url
  end

  def show
    render json: @course, host: request.base_url
  end

  api!
  param_group :course
  example '
  {
    "course":{
      "title": "nice course",
      "description": "cool description"
    }
  }
  {
    "id": 7,
    "title": "nice course",
    "description": "cool description",
    "avatar": null,
    "owner": {
      "id": 3,
      "firstName": "tim2",
      "lastName": "plat",
      "email": "tpltn",
      "avatar": null,
      "role": "admin"
    },
    "lectures": []
  }
  '
  example '
  {
    "course":{
      "title": "nice course",
      "description": "cool description"
    }
  }
  {
    "errors": "You are not authorized to access this page."
  }
  '
  error code: 400, desc: 'Empty course object'
  error code: 403, desc: 'User does not have access to create courses (ex: student)'
  error code: 422, desc: 'Invalid course'
  def create
    course = Course.new course_params
    course.owner_id = current_user.id
    authorize!(:create, course)

    if course.save
      render json: course, status: :created, host: request.base_url
    else
      render json: { errors: course.errors }, status: :unprocessable_entity
    end
  end

  api!
  param_group :course
  example '
  {
    "course":{
      "description": "my cool description"
    }
  }
  {
    "id": 7,
    "title": "nice course",
    "description": "my cool description",
    "avatar": null,
    "owner": {
      "id": 3,
      "firstName": "tim2",
      "lastName": "plat",
      "email": "tpltn",
      "avatar": null,
      "role": "admin"
    },
    "lectures": []
  }
  '
  error code: 400, desc: 'Empty course object'
  error code: 403, desc: 'User does not have access to update this course'
  error code: 422, desc: 'Invalid course'
  def update
    authorize!(:update, @course)
    if @course.update(course_params)
      render json: @course, host: request.base_url
    else
      render json: { errors: @course.errors }, status: :unprocessable_entity
    end
  end

  api!
  example '
  {
    "errors": "You are not authorized to access this page."
  }
  '
  error code: 403, desc: 'User does not have access to delete this course'
  error code: 404, desc: 'Course not found'
  def destroy
    authorize!(:destroy, @course)
    @course.destroy
    head :no_content
  end

  api!
  example '
  {
    "data": "Вы успешно записаны на курс"
  }
  '
  example '
  {
    "errors": "Необходимо войти на сайт"
  }
  '
  example '
  {
    "errors": "Невозможно найти указанный курс"
  }
  '
  example '
  {
    "errors": "Невозможно записаться на курс"
  }
  '
  error code: 401, desc: 'Authorization token not provided or invalid'
  error code: 404, desc: 'Could not find specified course'
  error code: 422, desc: 'Could not join course'
  def join
    success = current_user.try_join_course @course

    if success
      render json: { data: I18n.t('courses.join.success') }
    else
      render json: { errors: I18n.t('courses.join.fail') }, status: :unprocessable_entity
    end
  end

  api!
  example '
  {
    "data": "Вы успешно отписаны от курса"
  }
  '
  example '
  {
    "errors": "Необходимо войти на сайт"
  }
  '
  example '
  {
    "errors": "Невозможно найти указанный курс"
  }
  '
  example '
  {
    "errors": "Невозможно отписаться от курса"
  }
  '
  error code: 401, desc: 'Authorization token not provided or invalid'
  error code: 404, desc: 'Could not find specified course'
  error code: 422, desc: 'Could not leave course'
  def leave
    success = current_user.try_leave_course @course

    if success
      render json: { data: I18n.t('courses.leave.success') }
    else
      render json: { errors: I18n.t('courses.leave.fail') }, status: :unprocessable_entity
    end
  end

  api!
  example '
  {
    "participating": true
  }
  '
  example '
  {
    "errors": "Необходимо войти на сайт"
  }
  '
  example '
  {
    "errors": "Невозможно найти указанный курс"
  }
  '
  error code: 401, desc: 'Authorization token not provided or invalid'
  error code: 404, desc: 'Could not find specified course'
  def participating
    participating = current_user.participate_in? @course
    render json: { participating: participating }
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(:title, :description, :avatar)
  end
end
