require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "cannot save user without name" do
    u = User.new email: 'test@test.hu'
    assert !u.save, "Houston, we have a problem"
  end

  test "cannot save user without email" do
    u = User.new name: 'test'
    assert !u.save, "Houston, we have a problem"
  end

  test "cannot save user with existing email" do
    u = User.new email: users(:me).email
    assert !u.save, "Houston, we have a problem"
  end

  test "encrypted" do
    u = User.find users(:me).id
    assert_equal u.encrypted_password, Digest::SHA1.hexdigest('titoktitok'), "A titkositas nem megfelelo"
  end
end
