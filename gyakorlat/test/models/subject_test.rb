require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "can save" do
    s = Subject.new name: subjects(:one).name, credit: subjects(:one).credit
    assert s.save, "Subject saved"
  end
end
