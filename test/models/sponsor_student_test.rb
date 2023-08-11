require "test_helper"

class SponsorStudentTest < ActiveSupport::TestCase
  test "validations" do
    sponsor = SponsorStudent.create
    assert_includes sponsor.errors[:name], "can't be blank"
    assert_includes sponsor.errors[:description], "can't be blank"
    assert_includes sponsor.errors[:age], "can't be blank"
  end
end
