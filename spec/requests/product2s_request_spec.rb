require "rails_helper"

RSpec.describe "Product2s", type: :request do
  include Devise::Test::IntegrationHelpers
  setup do
    @u = User1.create(email: "rp@ex.com", password: "password", password_confirmation: "password", role: "admin")
    sign_in @u
  end

  it "get index path" do
    get product2s_path
    expect(response).to have_http_status(200)
  end

  it "get new path" do
    get new_product2_path
    expect(response).to be_successful
  end
end
