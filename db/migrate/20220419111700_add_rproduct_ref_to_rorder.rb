class AddRproductRefToRorder < ActiveRecord::Migration[7.0]
  def change
    add_reference :rorders, :rproduct
  end
end
