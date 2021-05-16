require "test_helper"

class SemestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @semester = semesters(:one)
    @semester2 = semesters(:two)
    #login to "me" user
    post '/sessions/create', params: { email: users(:me).email, password: 'titok' }, headers: { 'HTTP_REFER': '/say/hello' }
  end

  test "should change field only" do
    patch semester_url(@semester), params: { semester: { average: 15.6 } }
    assert_redirected_to semester_url(@semester)
    @s = Semester.where(id: @semester.id).last
    assert_not_equal @s.average, @semester.average, "Change is not working"
    assert_equal @s.average, 15.6, "Change is not working"
    assert_equal @s.money, @semester.money, "Change is not working"
    assert_not_nil session[:user]
  end


  test "should get index" do
    get semesters_url
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should get new" do
    get new_semester_url
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should create semester" do
    assert_difference('Semester.count') do
      post semesters_url, params: { semester: { average: @semester.average, credits: @semester.credits, money: @semester.money, number: @semester.number } }
    end

    assert_redirected_to semester_url(Semester.last)
    assert_not_nil session[:user]
  end

  test "should show semester" do
    get semester_url(@semester)
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should get edit" do
    get edit_semester_url(@semester)
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should update semester" do
    patch semester_url(@semester), params: { semester: { average: @semester.average, credits: @semester.credits, money: @semester.money, number: @semester.number } }
    assert_redirected_to semester_url(@semester)
    assert_not_nil session[:user]
  end

  test "should destroy semester" do
    assert_difference('Semester.count', -1) do
      delete semester_url(@semester)
    end

    assert_redirected_to semesters_url
    assert_not_nil session[:user]
  end
end
