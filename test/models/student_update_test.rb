require "test_helper"

class StudentUpdateTest < ActiveSupport::TestCase
  test "validations" do
    student_update = StudentUpdate.create
    assert_includes student_update.errors[:title], "can't be blank"
    assert_includes student_update.errors[:season], "can't be blank"
    assert_includes student_update.errors[:description], "can't be blank"
  end

  test "downcase season" do
    student_update = StudentUpdate.new(title: 'Mariam gets award', season: 'Fall',
                                          description: 'Mariam won spelling bee competition',
                                          sponsor_student: sponsor_students(:asmaa))
    assert_not_equal 'fall', student_update.season

    student_update.save
    assert_equal 'fall', student_update.season
  end
end
