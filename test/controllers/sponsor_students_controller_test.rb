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

  test "#edit" do
    get edit_sponsor_student_path(sponsor_students(:asmaa))

    assert_response :success
  end

  test "#create" do

    assert_difference 'SponsorStudent.count' do
      post sponsor_students_path, params: { sponsor_student: { name: 'Mariam', age: 13,
                                                               description: 'Mariam wants to become a science teacher.'}}
    end

    assert_response :redirect
    assert_match 'Mariam', SponsorStudent.last.name
  end

  test "#create fails" do

    assert_no_difference 'SponsorStudent.count' do
      post sponsor_students_path, params: { sponsor_student: { name: '', age: 13,
                                                               description: 'Mariam wants to become a science teacher.'}}
    end

    assert_response :unprocessable_entity
  end

  test "#update" do
    student = sponsor_students(:asmaa)

    put sponsor_student_path(student), params: { sponsor_student: { name: 'Mariam'}}

    assert_response :redirect
    assert_match 'Mariam', student.reload.name
  end

  test "#destroy" do
    student = sponsor_students(:asmaa)

    delete sponsor_student_path(student)

    assert_response :redirect
  end
end
