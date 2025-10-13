class Api::V1::CoursesController < ApplicationController
  # Disable CSRF protection for API-only routes
  protect_from_forgery with: :null_session

  def index
    # Find the current trimester
    current_trimester = Trimester.find_by(current: true)
    return render json: { courses: [] }, status: :ok unless current_trimester

    # Get courses in that trimester
    courses = current_trimester.courses

    # Build JSON response
    courses_array = courses.map do |course|
      {
        id: course.id,
        title: course.title,
        application_deadline: course.trimester.application_deadline,
        start_date: course.trimester.start_date,
        end_date: course.trimester.end_date
      }
    end

    render json: { courses: courses_array }, status: :ok
  end
end