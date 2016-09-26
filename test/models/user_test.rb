require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'palak@gmail.com', password:'password', name: 'Palak Agrawal')
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user should have a name" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "user should have an email address" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "user should have unique email address" do
    @user.save
    user2 = @user.dup
    user2.email = user.email.upcase
    assert_not @user2.valid?
  end


  test "email should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "user should have a password" do
    @user.password = ""
    assert_not @user.valid?
  end
end
