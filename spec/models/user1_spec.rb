require "rails_helper"

RSpec.describe User1, type: :model do
  before do
    @u = User1.create(email: "rutikpatel@example.com", password: "password", password_confirmation: "password")
  end

  it "has a valid user" do
    expect(@u).to be_valid
  end

  it "has nil email id" do
    @u.email = ""
    expect(@u).to_not be_valid
  end

  it "has length more than 6 character" do
    expect(@u).to be_valid
  end

  it "has same password and confirmation password" do
    @u.password == @u.password_confirmation
    expect(@u).to be_valid
  end
end
