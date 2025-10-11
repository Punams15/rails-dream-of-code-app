class CoursesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    # show course details; if you show enrollments here you may also require admin,
    # or show enrollments separately and protect that route (below)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: 'Course created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: 'Course deleted.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:coding_class_id, :trimester_id, :max_enrollment)
  end
end