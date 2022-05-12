class AddRefToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrollments, :user
    add_reference :enrollments, :event
  end
end
