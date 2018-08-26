class Project < ApplicationRecord
  validates :project_number, presence: true
  validates :project_name, presence: true
  validates :project_time, presence: true
  has_many :project_roles, dependent: :delete_all
end
