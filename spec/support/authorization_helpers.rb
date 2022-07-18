module AuthorizationHelpers
  def assign_product_role!(user, product_role, product)
    ProductRole.where(user: user, product: product).delete_all
    ProductRole.create!(user: user, product_role: product_role, product: product)
  end

  def assign_project_role!(user, project_role, project)
    ProjectRole.where(user: user, project: project).delete_all
    ProjectRole.create!(user: user, project_role: project_role, project: project)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end
