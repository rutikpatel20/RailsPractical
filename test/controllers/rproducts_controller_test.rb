require "test_helper"

class RproductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rproducts_index_url
    assert_response :success
  end

  test "should get new" do
    get rproducts_new_url
    assert_response :success
  end

  test "should get show" do
    get rproducts_show_url
    assert_response :success
  end

  test "should get edit" do
    get rproducts_edit_url
    assert_response :success
  end
end
