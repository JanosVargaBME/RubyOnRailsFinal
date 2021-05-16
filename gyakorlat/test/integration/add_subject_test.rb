require "test_helper"

class AddSubjectTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
  end
  test "add new subject" do
    get '/welcome/index'
    assert_response :success
    assert_nil session[:user]

    #teszteljuk a bejelentkezest
    post '/sessions/create', params: { email: users(:me).email, password: 'titok' }, headers: { 'HTTP_REFER': '/welcome/index' }
    assert_response :redirect
    assert_equal session[:user], users(:me).id
    follow_redirect!
    assert_select 'a', 'Logout'

    #subject index.html.erb fajlja
    #lekerdezzuk a subject-ek szamat es annyi sora kell legyen a tablazatnak
    get subjects_path
    assert_response :success
    assert_select 'tbody tr', Subject.count

    #subject show.html.erb fajlja
    get show_subject_path(subjects(:one).id)
    assert_response :success
    assert_select 'strong', 'Name:'

    #subject _form.html.erb fajlja
    get edit_subject_path(subjects(:one).id)
    assert_response :success
    assert_select 'form', 1

    #hozzaadunk a listahoz egy uj elemet
    @size = Subject.count
    post subjects_url, params: { subject: { code: "NEW_CODE2", credit: @subject.credit, mandatory: "YESSS", name: @subject.name, semester: @subject.semester, tipus: @subject.tipus } }, headers: {'HTTP_REFERER': "/subjects/#{subjects.last.id}"}
    assert_response :redirect
    assert_not_equal @size , Subject.count, "Nem adodott hozza az uj elem"
    assert_equal Subject.where(code: "NEW_CODE2").first.mandatory, "YESSS", "Nem adodott hozza az uj elem"
    follow_redirect!
    assert_select 'strong', 'Name:'

    #kijelentkezunk es a fooldalra kerulunk
    get '/sessions/destroy', headers: { 'HTTP_REFER': '/welcome/index' }
    assert_response :redirect
    assert_nil session[:user]
    follow_redirect!
    assert_select 'h1', "Subject Administration!"

  end
end
