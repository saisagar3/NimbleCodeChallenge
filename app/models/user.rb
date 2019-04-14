class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {'Instructor': 0, 'Student': 1, 'Others': 2}
  has_many :subscribers, dependent: :destroy
  has_many :coursers, through: :subscribers


  def to_s
    self.first_name
    self.id
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  # def course_instructor?(course)
  #   if not self.Instructor?
  #     return false
  #   end
  #   if @course.user.id == self.id
  #     return true
  #   end
  #   false
  # end
end
