class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :project_number
      t.string :project_name
      t.string :project_time

      t.timestamps
    end
  end
end
