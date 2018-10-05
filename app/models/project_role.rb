class ProjectRole < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def self.available_project_roles
  	%w(manager editor viewer)
  end
end
