class AddProduct1RefToOrder1 < ActiveRecord::Migration[7.0]
  def change
    add_reference :order1s, :product1
  end
end
