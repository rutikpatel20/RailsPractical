class AddUser1RefToProduct2s < ActiveRecord::Migration[7.0]
  def change
    add_reference :product2s, :user1
  end
end
