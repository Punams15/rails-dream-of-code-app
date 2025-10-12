class Api::V1::EnrollmentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    # Find the course by its ID in the URL
    course = Course.find(params[:course_id])

    # Get all enrollments for this course
    enrollments = course.enrollments.includes(:student)

    # Build the JSON response
    enrollments_array = enrollments.map do |enrollment|
      {
        id: enrollment.id,
        studentId: enrollment.student.id,
        studentFirstName: enrollment.student.first_name,
        studentLastName: enrollment.student.last_name,
        finalGrade: enrollment.final_grade || ""
      }
    end

    render json: { enrollments: enrollments_array }, status: :ok
  end
end