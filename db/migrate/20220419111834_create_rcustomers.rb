class CreateRcustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :rcustomers do |t|
      t.string :name
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
