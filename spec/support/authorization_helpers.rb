module AuthorizationHelpers
  def assign_product_role!(user, role, project)
    ProductRole.where(user: user, product: product).delete_all
    ProductRole.create!(user: user, role: role, product: product)  
  end

  def assign_project_role!(user, role, project)
    ProjectRole.where(user: user, project: project).delete_all
    ProjectRole.create!(user: user, role: role, project: project)  
  end  
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end