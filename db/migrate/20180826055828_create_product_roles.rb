class CreateProductRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :product_roles do |t|
      t.references :user, foreign_key: true
      t.string :role
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
