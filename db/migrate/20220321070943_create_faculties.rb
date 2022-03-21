class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :email
      t.date :birthdate
      t.string :department
      t.string :designation

      t.timestamps
    end
  end
end
