require "test_helper"

class User2sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user2s_index_url
    assert_response :success
  end

  test "should get edit" do
    get user2s_edit_url
    assert_response :success
  end

  test "should get new" do
    get user2s_new_url
    assert_response :success
  end

  test "should get show" do
    get user2s_show_url
    assert_response :success
  end
end
