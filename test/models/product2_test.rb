require "test_helper"

class Product2Test < ActiveSupport::TestCase
  def setup
    u = User1.create(email: "rutik@example.com", password: "password", password_confirmation: "password")
    @product2 = Product2.new(product_name: "Laptop", price: 20, user1_id: u.id, description: "laptop under 30")
  end

  test "the truth" do
    assert true
  end

  test "Product should be valid" do
    assert @product2.valid?
  end

  test "Product should be saved" do
    assert @product2.save
  end

  test "name should be unique" do
    @product2.save
    u1 = User1.create(email: "rutvik@example.com", password: "aaaaaa", password_confirmation: "aaaaaa")
    @product3 = Product2.new(product_name: "Laptop", user1_id: u1.id)
    assert_not @product3.valid?
  end
end
