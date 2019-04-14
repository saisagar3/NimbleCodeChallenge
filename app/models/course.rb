class Course < ApplicationRecord
  has_many :subscribers, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  has_many :users, through: :subscribers

  def subscribed?(user)
    self.users.where(id: user.id).count >= 1
  end

  def subscribe(user)
    if not self.subscribed? user
      self.users << user
    end
  end

  def unsubscribe(user)
    self.subscribers.where(user: user).destroy_all
  end
  
end
