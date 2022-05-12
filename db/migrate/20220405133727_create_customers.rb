class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
