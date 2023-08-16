require "test_helper"

class SponsorStudentTest < ActiveSupport::TestCase
  test "validations" do
    sponsor = SponsorStudent.create
    assert_includes sponsor.errors[:name], "can't be blank"
    assert_includes sponsor.errors[:description], "can't be blank"
    assert_includes sponsor.errors[:age], "can't be blank"
    assert_includes sponsor.errors[:unique_identifier], "can't be blank"
  end

  test 'unique identifier' do
    sponsor = SponsorStudent.new(name: 'Mariam', description: 'good student', age: 12)
    assert_nil sponsor.unique_identifier
    byebug
    sponsor.save
    assert sponsor.unique_identifier.present?
  end
end
