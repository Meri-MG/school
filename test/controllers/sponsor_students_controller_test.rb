require "test_helper"

class SponsorStudentsControllerTest < ActionDispatch::IntegrationTest
  test "#index" do
    get sponsor_students_path

    assert_response :success
  end

  test "#new" do
    get new_sponsor_student_path

    assert_response :success
  end

  test "#show" do
    get sponsor_student_path(sponsor_students(:asmaa))

    assert_response :success
  end

  test "#create" do

    assert_difference 'SponsorStudent.count' do
      post sponsor_students_path, params: { sponsor_student: { name: 'Mariam', age: 13,
                                                             description: 'Mariam wants to become a science teacher. At home she enjoys drawing and learning new things in her free time.'}}
    end

    assert_response :redirect
    assert_match 'Mariam', SponsorStudent.last.name
  end

  test "#create failes" do

    assert_no_difference 'SponsorStudent.count' do
      post sponsor_students_path, params: { sponsor_student: { name: '', age: 13,
                                                             description: 'Mariam wants to become a science teacher. At home she enjoys drawing and learning new things in her free time.'}}
    end

    assert_response :unprocessable_entity
  end
end
