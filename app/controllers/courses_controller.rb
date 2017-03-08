class CoursesController < ApplicationController
  def index
    render json: Course.order(updated_at: :desc)
  end

  def show
    course = Course.find_by(id: params[:id])

    if course
      render json: course
    else
      render json: { errors: 'Course not found' }, status: :not_found
    end
  end

  def create
    course = Course.new course_params

    if course.save
      render json: course, status: :created
    else
      render json: { errors: course.errors }, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :owner_id, :avatar)
  end
end
