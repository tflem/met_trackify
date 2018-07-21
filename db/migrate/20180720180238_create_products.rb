class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :article_number
      t.string :article_name
      t.date :date_received
      t.string :article_location

      t.timestamps
    end
  end
end
