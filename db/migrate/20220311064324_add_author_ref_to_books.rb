class AddAuthorRefToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :author, null: false
  end
end
