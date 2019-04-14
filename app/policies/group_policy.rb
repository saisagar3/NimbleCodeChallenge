class GroupPolicy < ApplicationPolicy
  
  def show?
    true
  end  
  
  def create?
    true
  end

  def update?
    create?
  end
end