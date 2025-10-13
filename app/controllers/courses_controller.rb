# app/controllers/courses_controller.rb
class CoursesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
    respond_to do |format|
      format.html # normal view
      format.json { render json: @courses }
    end
  end

  def show
    respond_to do |format|
      format.html # normal show page
      format.json { render json: @course }
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course created.' }
        format.json { render :show, status: :created, location: @course }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course updated.' }
        format.json { render :show, status: :ok, location: @course }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_path, notice: 'Course deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:coding_class_id, :trimester_id, :max_enrollment)
  end
end
