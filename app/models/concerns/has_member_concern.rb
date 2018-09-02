module HasMemberConcern
  def has_product_member?(user)
    product_roles.exists?(user_id: user)
  end
  
  def has_project_member?(user)
    project_roles.exists?(user_id: user)
  end  
end
