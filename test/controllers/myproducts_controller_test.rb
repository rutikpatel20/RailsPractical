require "test_helper"

class MyproductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myproducts_index_url
    assert_response :success
  end

  test "should get new" do
    get myproducts_new_url
    assert_response :success
  end

  test "should get create" do
    get myproducts_create_url
    assert_response :success
  end

  test "should get show" do
    get myproducts_show_url
    assert_response :success
  end

  test "should get edit" do
    get myproducts_edit_url
    assert_response :success
  end

  test "should get update" do
    get myproducts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get myproducts_destroy_url
    assert_response :success
  end
end
