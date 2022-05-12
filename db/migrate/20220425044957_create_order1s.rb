class CreateOrder1s < ActiveRecord::Migration[7.0]
  def change
    create_table :order1s do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
