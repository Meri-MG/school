require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "validations" do
    student = Student.create
    assert_includes student.errors[:name], "can't be blank"
    assert_includes student.errors[:description], "can't be blank"
    assert_includes student.errors[:age], "can't be blank"
  end

  test 'unique identifier' do
    student = Student.new(name: 'Mariam', description: 'good student', age: 12)
    assert_nil student.unique_identifier

    student.save
    assert student.unique_identifier.present?
  end
end
