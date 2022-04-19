class CreateRorders < ActiveRecord::Migration[7.0]
  def change
    create_table :rorders do |t|
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
