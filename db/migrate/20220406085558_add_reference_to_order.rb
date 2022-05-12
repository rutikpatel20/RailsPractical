class AddReferenceToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :customer
    add_reference :orders, :myproduct
  end
end
