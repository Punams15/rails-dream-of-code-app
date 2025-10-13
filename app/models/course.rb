class Course < ApplicationRecord
  belongs_to :coding_class
  belongs_to :trimester
  has_many :enrollments
  has_many :students, through: :enrollments

  delegate :title, to: :coding_class
end
