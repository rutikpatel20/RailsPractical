class AddLikeColToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :like, :integer
  end
end
