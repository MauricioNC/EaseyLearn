require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get login_root
    assert_response :success
  end
end