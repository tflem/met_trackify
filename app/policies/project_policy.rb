class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none if user.nil?
      return scope.all if user.admin?

      scope.joins(:project_roles).where(project_roles: {user_id: user})
    end
  end

  def show?
    user.try(:admin?) ||
      record.has_project_member?(user)
  end

  def update?
    user.try(:admin?) ||
      record.has_manager?(user)
  end
end
