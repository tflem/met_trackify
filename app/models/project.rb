class Project < ApplicationRecord
  validates :project_number, presence: true
  validates :project_name, presence: true
  validates :project_time, presence: true
end
