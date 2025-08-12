class Course < ApplicationRecord
  belongs_to :coding_class
  belongs_to :trimester
  has_many :enrollments

  def student_email_list
    email_list = []
    self.enrollments.each do |enrollment|
      email_list << enrollment.student.email
    end
    email_list
  end
    
  end

  
  

 

