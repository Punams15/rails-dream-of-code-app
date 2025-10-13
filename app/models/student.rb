class Student < ApplicationRecord
  has_many :enrollments
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_many :courses, through: :enrollments
  def full_name
    "#{first_name} #{last_name}"
  end
end
