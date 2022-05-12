class AddEventRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :event
  end
end
