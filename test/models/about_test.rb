require "test_helper"

class AboutTest < ActiveSupport::TestCase
  test "validations" do
    about = About.create
    assert_includes about.errors[:title], "can't be blank"
    assert_includes about.errors[:content], "can't be blank"
  end
end
