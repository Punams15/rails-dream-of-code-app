class Api::V1::StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/v1/students
  def index
    students = Student.all
    render json: students
  end

  # POST /api/v1/students
  def create
    student = Student.new(student_params)
    if student.save
      render json: { student: student.slice(:id, :first_name, :last_name, :email) }, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end

