class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none if user.nil?
      return scope.all if user.admin?
  
      scope.joins(:product_roles).where(product_roles: {user_id: user})
    end
  end  

  def show?
    user.try(:admin?) || record.product_roles.exists?(user_id: user)
  end

  def update?
    user.try(:admin?) || record.product_roles.exists?(user_id: user,
                                                      role: 'manager')
  end
end
