require "application_system_test_case"

class SemestersubjectsTest < ApplicationSystemTestCase
  setup do
    @semestersubject = semestersubjects(:one)
  end

  test "visiting the index" do
    visit semestersubjects_url
    assert_selector "h1", text: "Semestersubjects"
  end

  test "creating a Semestersubject" do
    visit semestersubjects_url
    click_on "New Semestersubject"

    fill_in "Exam", with: @semestersubject.exam
    fill_in "Homework", with: @semestersubject.homework
    fill_in "Labor", with: @semestersubject.labor
    fill_in "Mark", with: @semestersubject.mark
    fill_in "Subject", with: @semestersubject.subject_id
    click_on "Create Semestersubject"

    assert_text "Semestersubject was successfully created"
    click_on "Back"
  end

  test "updating a Semestersubject" do
    visit semestersubjects_url
    click_on "Edit", match: :first

    fill_in "Exam", with: @semestersubject.exam
    fill_in "Homework", with: @semestersubject.homework
    fill_in "Labor", with: @semestersubject.labor
    fill_in "Mark", with: @semestersubject.mark
    fill_in "Subject", with: @semestersubject.subject_id
    click_on "Update Semestersubject"

    assert_text "Semestersubject was successfully updated"
    click_on "Back"
  end

  test "destroying a Semestersubject" do
    visit semestersubjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Semestersubject was successfully destroyed"
  end
end
