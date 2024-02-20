require "test_helper"

class UserMfaSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_mfa_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get user_mfa_sessions_create_url
    assert_response :success
  end
end
