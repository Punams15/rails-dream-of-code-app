
require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses/:id" do
    before do
      coding_class = CodingClass.create!(title: "Intro to Ruby on Rails")
      trimester = Trimester.create!(
        term: 'Fall',
        year: Date.today.year.to_s,
        start_date: Date.today - 1.day,
        end_date: Date.today + 2.months,
        application_deadline: Date.today - 10.days
      )

      @course = Course.create!(coding_class: coding_class, trimester: trimester)
      @student = Student.create!(name: "Poonam")
      Enrollment.create!(course: @course, student: @student)
    end

    it "returns 200 OK" do
      get course_path(@course)
      expect(response).to have_http_status(:ok)
    end

    it "displays the course title" do
      get course_path(@course)
      expect(response.body).to include(@course.coding_class.title)
    end

    it "displays at least one enrolled student" do
      get course_path(@course)
      expect(response.body).to include(@student.name)
    end
  end
end