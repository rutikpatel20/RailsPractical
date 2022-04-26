class AddRoleToUser1s < ActiveRecord::Migration[7.0]
  def change
    add_column :user1s, :role, :integer
  end
end
