class JoinTablesBooksAndAuthors < ActiveRecord::Migration[7.0]
  def change
    create_join_table :authors, :books
  end
end
