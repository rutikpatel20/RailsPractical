class AddPictureColToUser2 < ActiveRecord::Migration[7.0]
  def change
    add_column :user2s, :picture, :string
  end
end
