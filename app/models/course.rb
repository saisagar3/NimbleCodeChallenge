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

  def group(user)
    if self.subscribed? user
      return self.subscribers.where(user: user).take.group
    else
      return nil
    end
  end

  def instructor?(user)
    if self.users.Instructor 
      return true
    end
    return false
  end

  def to_s
    self.first_name
  end
end
