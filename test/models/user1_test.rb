require "test_helper"

class User1Test < ActiveSupport::TestCase
  def setup
    @u = User1.create(email: "rutik1@example.com", password: "rutikp", password_confirmation: "rutikp", role: "admin")
  end

  test "data should be valid" do
    assert @u.valid?
  end

  test "email can not be blank" do
    @u.email = ""
    assert_not @u.save
  end

  test "password should be greater than 6 character" do
    @u.password = "rutik"
    assert_not @u.save
  end
end
