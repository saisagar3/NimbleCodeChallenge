class UserPolicy <  ApplicationPolicy
 
  def index?
    @role = user.role
    if @role === 'Instructor'
      true
    end
  end

  def show?
    @role = user.role
    if @role === 'Instructor' and @role === 'Student'
      true
    end
  end

  def create?
    true
  end

  def update?
    @role = user.role
    if @role === 'Instructor' and @role === 'Student'
      true
    end
  end

  def destroy?
    @role = user.role
    if @role === 'Instructor' and @role === 'Student'
      true
    end
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