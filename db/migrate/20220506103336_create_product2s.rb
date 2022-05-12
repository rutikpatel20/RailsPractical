class CreateProduct2s < ActiveRecord::Migration[7.0]
  def change
    create_table :product2s do |t|
      t.string :product_name
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
