class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none if user.nil?
      return scope.all if user.admin?

      scope.joins(:product_roles).where(product_roles: {user_id: user})
    end
  end  

  def show?
    user.try(:admin?) ||
    record.has_product_member?(user)
  end

  def update?
    user.try(:admin?) ||
    record.has_manager?(user)
  end
end
