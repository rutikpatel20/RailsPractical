require "test_helper"

class Product2sControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in user1s(:one)
    @product = product2s(:one)
  end

  def setup
    @u = User1.create(email: "rutik@example.com", password: "aaaaaa", password_confirmation: "aaaaaa")
    @product = Product2.new(product_name: "Laptop", price: 20, user1_id: @u.id, description: "dfghsdgfds")
    @product.save
  end

  test "should get index" do
    get product2s_url
    assert_response :success
  end

  test "should get new" do
    get new_product2_path
    assert_response :success
  end

  test "should create product" do
    u1 = User1.create(email: "rutikpatel@example.com", password: "abcdef", password_confirmation: "abcdef")
    assert_difference("Product2.count") do
      post product2s_path, params: { product2: { product_name: "MacBook", price: 290, description: "dfghsdgfds", user1_id: u1.id } }
    end
    assert_redirected_to product2s_url
  end

  test "should get show" do
    get product2s_path(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product2_path(@product.id)
    assert_response :success
  end

  test "should update product" do
    patch product2_url(@product), params: { product2: { product_name: "MacBook" } }
    assert_redirected_to product2_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product2.count", -1) do
      delete product2_path(@product)
    end
    assert_redirected_to product2s_url
  end
end
