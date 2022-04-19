require "test_helper"

class RordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rorders_index_url
    assert_response :success
  end

  test "should get new" do
    get rorders_new_url
    assert_response :success
  end

  test "should get show" do
    get rorders_show_url
    assert_response :success
  end

  test "should get edit" do
    get rorders_edit_url
    assert_response :success
  end
end
