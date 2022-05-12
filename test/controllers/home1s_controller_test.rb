require "test_helper"

class Home1sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home1s_index_url
    assert_response :success
  end
end
