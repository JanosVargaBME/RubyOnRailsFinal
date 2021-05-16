require "application_system_test_case"

class HellosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit '/welcome/index'

    #Azt teszteli a program, hogy belepes utan letrehozunk egy uj semester objektumot
    #Majd ezutan kilepunk
    click_on "Login"
    fill_in "Email", with: 'testuser1@test.hu'
    fill_in "Password", with: 'titok'
    click_on "Login"

    assert_selector "a", text: "Semester Infos"
    click_on "Semester Infos"
    @size = Semester.count
    assert_selector "a", text: "+"
    click_on "+"

    fill_in "Number", with: 10
    fill_in "Credits", with: 30
    fill_in "Average", with: 5.0
    fill_in "Money", with: "20000"

    click_on "Create Semester"

    assert_not_equal @size, Semester.count


    assert_selector "a", text: "Logout"
  end
end
