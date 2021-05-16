require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
    @subject2 = subjects(:two)
    #login to "me" user
    post '/sessions/create', params: { email: users(:me).email, password: 'titok' }, headers: { 'HTTP_REFER': '/say/hello' }
  end

  test "edit+update a subject" do
    patch subject_url(@subject), params: { subject: { code: "XYZ123", credit: @subject.credit, mandatory: "no", name: @subject.name, semester: @subject.semester, tipus: @subject.tipus } }
    assert_redirected_to subject_url(@subject)
    assert_not_nil session[:user]

    @s = Subject.find subjects(:one).id
    assert_equal @s.code, "XYZ123", "Az edit/update nem mukodik"
    assert_not_equal @s.mandatory, "yes", "Az edit/update nem mukodik"
  end

  test "should get index" do
    get subjects_url
    assert_response :success
    assert_equal @subject.semester, "1", "A get nem mukodik"
    assert_not_nil session[:user]
  end

  test "should get new" do
    get new_subject_url
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post subjects_url, params: { subject: { code: @subject.code, credit: @subject.credit, mandatory: @subject.mandatory, name: @subject.name, semester: @subject.semester, tipus: @subject.tipus } }
    end

    assert_redirected_to subject_url(Subject.last)
    assert_not_nil session[:user]
  end

  test "should show subject" do
    get subject_url(@subject)
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should get edit" do
    get edit_subject_url(@subject)
    assert_response :success
    assert_not_nil session[:user]
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { code: @subject.code, credit: @subject.credit, mandatory: @subject.mandatory, name: @subject.name, semester: @subject.semester, tipus: @subject.tipus } }
    assert_redirected_to subject_url(@subject)
    assert_not_nil session[:user]
  end

  #Nem tesztelem a torleset, mert kesobb meg kelleni fog

  # test "should destroy subject" do
  #   assert_difference('Subject.count', -1) do
  #     delete subject_url(@subject)
  #   end
  #
  #   assert_redirected_to subjects_url
  #   assert_not_nil session[:user]
  # end
end
