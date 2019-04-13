class GroupPolicy < ApplicationPolicy
  
  def show?
    true
  end  
  
  def create?
    if Course.where( subscriber_id: Subscriber.where( user_id: user.id).first.id).exists? 
        true
    end
  end

  def update?
    if user.user_role === 'student'
      true
    end
  end
end