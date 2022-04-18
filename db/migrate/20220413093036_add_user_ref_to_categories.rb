class AddUserRefToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user
  end
end
