require "test_helper"

class SemestersubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @semestersubject = semestersubjects(:one)
    @semestersubject2 = semestersubjects(:two)
    #login to "me" user
    post '/sessions/create', params: { email: users(:me).email, password: 'titok' }, headers: { 'HTTP_REFER': '/say/hello' }
  end

  test "should change attrib" do
    patch semestersubject_url(@semestersubject), params: { semestersubject: { homework: "FAILED" } }
    @s = Semestersubject.where(id: @semestersubject.id).last
    assert_equal @s.homework, "FAILED", "didnt change update"
  end

  test "should not update" do
    patch semestersubject_url(@semestersubject), params: { semestersubject: { subject_id: nil } }
    assert_response 422
  end

  test "should not create object with null user and subject" do
    post semestersubjects_url, params: { semestersubject: { user: nil, subject_id: nil } }
    #ilyen hibat kell dobnia ha a user vagy a subject mezot uresen hagyjuk
    assert_response 422
  end

  test "should create new object" do
    post semestersubjects_url, params: { semestersubject: { user: users(:me), subject_id: @semestersubject2.subject_id } }
    @s = Semestersubject.where(subject_id: @semestersubject2.subject_id).last
    assert_equal @s.user.name, "Test User1", "create is not working"
    assert_equal @s.subject_id, @semestersubject2.subject_id, "create is not working"
    assert_equal @s.subject.name, "Prog2Test", "create is not working"
    assert_not_nil session[:user]
  end

  test "should get index" do
    get semestersubjects_url
    assert_not_equal @semestersubject.id, @semestersubject2.id, "Rossz az id"
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should get new" do
    get new_semestersubject_url
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should create semestersubject" do
    assert_difference('Semestersubject.count') do
      post semestersubjects_url, params: { semestersubject: { exam: @semestersubject.exam, homework: @semestersubject.homework, labor: @semestersubject.labor, mark: @semestersubject.mark, subject_id: @semestersubject.subject_id } }
    end

    assert_redirected_to semestersubject_url(Semestersubject.last)
    assert_not_nil session[:user]
  end

  test "should show semestersubject" do
    get semestersubject_url(@semestersubject)
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should get edit" do
    get edit_semestersubject_url(@semestersubject)
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should update semestersubject" do
    patch semestersubject_url(@semestersubject), params: { semestersubject: { exam: @semestersubject.exam, homework: @semestersubject.homework, labor: @semestersubject.labor, mark: @semestersubject.mark, subject_id: @semestersubject.subject_id } }
    assert_redirected_to semestersubject_url(@semestersubject)
    assert_not_nil session[:user]
  end

  test "should destroy semestersubject" do
    assert_difference('Semestersubject.count', -1) do
      delete semestersubject_url(@semestersubject)
    end

    assert_redirected_to semestersubjects_url
    assert_not_nil session[:user]
  end
end
