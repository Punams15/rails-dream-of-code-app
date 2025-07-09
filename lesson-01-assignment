QUESTION 1
Task 1: Collect emails for students in the current Intro course

ActiveRecord queries I used:

# 1 Find the class and trimester 
# Find the coding class
intro_class = CodingClass.find_by(title: "Intro to Programming")

# Find the Spring 2025 trimester
spring_2025 = Trimester.find_by(year: "2025", term: "Spring")


# 2 Find the course record 
# Find the course for Intro to Programming in Spring 2025
course = Course.find_by(
  coding_class_id: intro_class.id,
  trimester_id: spring_2025.id
)

# 3 Get  the first 2 students’ IDs and emails 
#join Students → Enrollments → Courses to filter only students enrolled in that course 
students = Student.joins(:enrollments)
                  .where(enrollments: { course_id: course.id })
                  .distinct
#Print the first 2 students’ IDs and emails
students.limit(2).each do |s|
  puts "#{s.id}, #{s.email}"
end

#Result:41, vince@cole.example and 42, ed@keeling-gleichner.test

Question 2
Task 2: Email all mentors who have not assigned a final grade

ActiveRecord queries I used: (same as code of question:1 , from steps 1 to 2)

# 1 Find the class and trimester 
# Find the coding class
intro_class = CodingClass.find_by(title: "Intro to Programming")

# Find the Spring 2025 trimester
spring_2025 = Trimester.find_by(year: "2025", term: "Spring")


# 2 Find the course record 
# Find the course for Intro to Programming in Spring 2025
course = Course.find_by(
  coding_class_id: intro_class.id,
  trimester_id: spring_2025.id
)

# 3 Find enrollments with no final grade
enrollments_without_grades = Enrollment.where(
  course_id: course.id,
  final_grade: nil
)

# 4 Find mentor assignments for these enrollments
mentor_assignments = MentorEnrollmentAssignment.where(
  enrollment_id: enrollments_without_grades.pluck(:id)
)

#5 Find the mentors
mentors = Mentor.where(
  id: mentor_assignments.pluck(:mentor_id)
).distinct

#6 Print 2 mentors
mentors.limit(2).each do |m|
  puts "#{m.id}, #{m.email}"
end

output:
25, geneva@moen.example
26, norris.will@daugherty.example