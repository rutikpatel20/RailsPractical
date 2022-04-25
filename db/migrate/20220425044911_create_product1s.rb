class CreateProduct1s < ActiveRecord::Migration[7.0]
  def change
    create_table :product1s do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
