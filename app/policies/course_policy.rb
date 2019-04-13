class CoursePolicy < ApplicationPolicy
  def index?
    true  
  end

  def show?
    true
  end

  def create?
    @role = user.role
    if @role === 'Instructor'
        true
    end
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end

end