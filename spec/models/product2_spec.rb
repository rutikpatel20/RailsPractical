require "rails_helper"

RSpec.describe Product2, type: :model do
  before do
    @u = User1.create(email: "rutikpatel@example.com", password: "password", password_confirmation: "password")
    @product2 = Product2.new(product_name: "Laptopp", price: 20, user1_id: @u.id, description: "laptop under 30 ")
    @product2.save
  end

  it "has a name" do
    expect(@product2).to be_valid
  end

  it "has a nil name" do
    @product2.product_name = ""
    expect(@product2).to_not be_valid
  end

  it "has a description longer than 10 character" do
    expect(@product2).to be_valid
  end

  it "has a description shorter than 10 character" do
    @product2.description = "Hello"
    expect(@product2).to_not be_valid
  end
end
