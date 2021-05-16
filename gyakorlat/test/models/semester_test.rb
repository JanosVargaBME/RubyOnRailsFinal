require "test_helper"

class SemesterTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "can save with id" do
    s = Semester.new number: semesters(:one).number, credits: semesters(:one).credits, id: 100
    assert s.save, "Semester saved"
  end
  test "Finding element from db" do
    s = Semester.find semesters(:one).id
    assert_equal s.money, "25000", "Penz nem egyezik meg!"
  end
  test "Finding element from db 2" do
    s = Semester.find semesters(:two).id
    assert_equal s.average, 4.1, "Atlag nem egyezik meg!"
  end
end
