class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :email
      t.date :birthdate
      t.string :department
      t.boolean :terms_of_usage

      t.timestamps
    end
  end
end
