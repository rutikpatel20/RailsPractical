require "rails_helper"

RSpec.feature "User1s", type: :feature do
  given!(:user1) { user1 = User1.create(email: "abc@abc.com", password: "123456", password_confirmation: "123456") }

  scenario "sign in with valid credentials " do
    visit "/user1s/sign_in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    check "Remember me"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
end
