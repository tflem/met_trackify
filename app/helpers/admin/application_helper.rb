module Admin::ApplicationHelper
  def product_roles
    hash = {}

    ProductRole.available_product_roles.each do |role|
      hash[role.titleize] = role
    end

    hash
  end

  def project_roles
    hash = {}

    ProjectRole.available_project_roles.each do |role|
      hash[role.titleize] = role
    end

    hash
  end
end
