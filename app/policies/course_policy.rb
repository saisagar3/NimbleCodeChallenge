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

  def update?
    create?
  end

  def destroy?
    create?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
  end
