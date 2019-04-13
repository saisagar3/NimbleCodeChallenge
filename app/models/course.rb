class Course < ApplicationRecord
  has_many :subscribers, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  has_many :users, through: :subscribers

  def to_s
   
  end
end
