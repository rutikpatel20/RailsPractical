class AddColumnToBooks < ActiveRecord::Migration[7.0]

  def up
    #add_column :books, :abstract, :text
  end

  def down
    remove_column :books, :abstract
  end
end
