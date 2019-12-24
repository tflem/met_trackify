class Project < ApplicationRecord
  validates :project_number, :project_name,
            :project_time, presence: true
  has_many  :project_roles, dependent: :delete_all

  def has_member?(user)
    project_roles.exists?(user_id: user)
  end

  [:manager, :editor, :viewer].each do |role|
    define_method "has_#{role}?" do |user|
      project_roles.exists?(user_id: user, project_role: role)
    end
  end
end
