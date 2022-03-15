class AddDataToAuthorss < ActiveRecord::Migration[7.0]
  def change
    Author.create(firstname: "paulo", lastname: "coelho", dob: "Sat 20 Jan 2001", email: "paulo@gmail.com")
    Author.create(firstname: "Amish", lastname: "Tripathi", dob: "Sat 20 Jan 2001", email: "amish@gmail.com")
  end
end
