require "test_helper"

class RcustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rcustomers_index_url
    assert_response :success
  end

  test "should get edit" do
    get rcustomers_edit_url
    assert_response :success
  end

  test "should get new" do
    get rcustomers_new_url
    assert_response :success
  end

  test "should get show" do
    get rcustomers_show_url
    assert_response :success
  end
end
