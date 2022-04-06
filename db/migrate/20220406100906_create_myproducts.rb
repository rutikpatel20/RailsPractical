class CreateMyproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :myproducts do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :capacity
      t.boolean :is_active
      t.integer :status

      t.timestamps
    end
  end
end
