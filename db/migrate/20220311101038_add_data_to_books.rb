class AddDataToBooks < ActiveRecord::Migration[7.0]
  def change
    Book.create(name: "The Alchemist", price: 100, author_id:8)
    Book.create(name: "Immortals of Meluha", price: 100, author_id:9)
  end
end
