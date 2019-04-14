class GroupPolicy < ApplicationPolicy
  
  def show?
    true    
  end  
  
  def create?
    show?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end