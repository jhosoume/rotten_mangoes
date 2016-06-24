require 'test_helper'

class Admin::SessionsControllerTest < ActionController::TestCase
  test "should get impersonate" do
    get :impersonate
    assert_response :success
  end

end
