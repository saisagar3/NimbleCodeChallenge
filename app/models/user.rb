class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {'Instructor': 0, 'Student': 1, 'Others': 2}

  def to_s
    self.first_name
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
