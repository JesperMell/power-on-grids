require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "example@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid?" do
    assert @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end



end
