class Group < ApplicationRecord
  belongs_to :course
  has_many :subscribers, :dependent => :nullify

  def has_user?(user)
    self.subscribers.where(user: user).count >= 1
  end

  
end
