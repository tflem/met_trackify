class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none if user.nil?
      return scope.all if user.admin?

      scope.joins(:project_roles).where(project_roles: {user_id: user})
    end
  end

  def show?
    user.try(:admin?) || record.project_roles.exists?(user_id: user)
  end
end