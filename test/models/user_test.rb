# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    assert user.valid?
  end

  test 'requires email' do
    user = User.new(password: 'password123')
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test 'requires valid email format' do
    user = User.new(email: 'not-an-email', password: 'password123')
    assert_not user.valid?
  end

  test 'requires password' do
    user = User.new(email: 'test@example.com')
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end

  test 'requires unique email' do
    user = User.new(email: users(:admin).email, password: 'password123')
    assert_not user.valid?
  end
end
