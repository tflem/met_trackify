class CreateProjectRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :project_roles do |t|
      t.references :user, foreign_key: true
      t.string :project_role
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
