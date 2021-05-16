require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    get hello_path
    assert_response :success
    #assert_select 'legend', "Login"
    assert_nil session[:user]

    post '/sessions/create', params: { email: users(:me).email,
      password: 'titok' }, headers: { 'HTTP_REFER': '/say/hello' }
    assert_response :redirect
    assert_equal session[:user], users(:me).id
    follow_redirect!
    assert_select 'a', 'Logout'
  end

  test "invalid login" do
    get hello_path
    assert_response :success
    #assert_select 'legend', "Login"
    assert_nil session[:user]

    post '/sessions/create', params: { email: users(:me).email,
      password: 'titok2' }, headers: { 'HTTP_REFER': '/say/hello' }
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    #assert_select 'legend', "Login"
  end

  test "logout" do
    get hello_path
    assert_response :success
    #assert_select 'legend', "Login"
    assert_nil session[:user]

    post '/sessions/create', params: { email: users(:me).email,
      password: 'titok' }, headers: { 'HTTP_REFER': '/say/hello' }
    assert_response :redirect
    assert_equal session[:user], users(:me).id
    follow_redirect!
    assert_select 'a', 'Logout'

    get '/sessions/destroy', headers: { 'HTTP_REFER': '/say/hello' }
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    #assert_select 'legend', "Login"
  end
end
