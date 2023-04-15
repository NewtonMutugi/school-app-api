class Api::V1::CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses
    render json: @courses
  end

  def show
    @course = current_user.courses.find(params[:id])
    render json: @course
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    @course = current_user.courses.find(params[:id])

    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course = current_user.courses.find(params[:id])
    @course.destroy
  end

  private

  def course_params
    params.require(:course).permit(:user_id, :unit_id)
  end
end
