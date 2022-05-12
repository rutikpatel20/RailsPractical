class CreateEmployee1s < ActiveRecord::Migration[7.0]
  def change
    create_table :employee1s do |t|
      t.string :employee_name
      t.string :email
      t.string :password
      t.string :gender
      t.string :hobbies
      t.string :address
      t.integer :mobile_number
      t.date :birth_date
      t.string :document
      t.timestamps
    end
  end
end
