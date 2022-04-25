class AddEmployee1refToAddress1 < ActiveRecord::Migration[7.0]
  def change
    add_reference :address1s, :employee1
  end
end
