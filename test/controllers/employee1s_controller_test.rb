require "test_helper"

class Employee1sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee1s_index_url
    assert_response :success
  end

  test "should get edit" do
    get employee1s_edit_url
    assert_response :success
  end

  test "should get new" do
    get employee1s_new_url
    assert_response :success
  end

  test "should get show" do
    get employee1s_show_url
    assert_response :success
  end
end
