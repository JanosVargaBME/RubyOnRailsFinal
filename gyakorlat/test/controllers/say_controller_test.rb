require "test_helper"

class SayControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    #get say_hello_url
    #assert_response :success

    get hello_url
    assert_response :success
    #assert_select 'legend', 'Login'
    assert_nil session[:user]
  end
end
