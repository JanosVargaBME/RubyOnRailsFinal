require "test_helper"

class SemestersubjectTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "can save with id" do
    s = Semestersubject.new subject: semestersubjects(:one).subject, user: semestersubjects(:one).user, id: 100
    assert s.save, "Semestersubject saved"
  end
  test "can find with id" do
    s = Semestersubject.find semestersubjects(:one).id
    assert_equal s.subject.name, "Prog1Test", "Semestersubject's find not working"
  end
end
