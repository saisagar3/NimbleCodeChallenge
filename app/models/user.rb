class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :citizen_id, presence: true
  validates :institute_id, presence: true, if: -> { self.Instructor? || self.Student? }
  
  enum role: {'Instructor': 0, 'Student': 1, 'Others': 2}
  
  has_many :subscribers, dependent: :destroy
  has_many :courses, through: :subscribers


  def to_s
    self.first_name
    self.id
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
