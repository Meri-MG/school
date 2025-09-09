# frozen_string_literal: true

require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get students_path

    assert_response :success
  end

  test '#new' do
    get new_student_path

    assert_response :success
  end

  test '#show' do
    get student_path(students(:asmaa))

    assert_response :success
  end

  test '#edit' do
    get edit_student_path(students(:asmaa))

    assert_response :success
  end

  test '#create' do
    assert_difference 'Student.count' do
      post students_path, params: { student: { name: 'Mariam', age: 13,
                                               description: 'Mariam wants to become a science teacher.' } }
    end

    assert_response :redirect
    assert_match 'Mariam', Student.last.name
  end

  test '#create fails' do
    assert_no_difference 'Student.count' do
      post students_path, params: { student: { name: '', age: 13,
                                               description: 'Mariam wants to become a science teacher.' } }
    end

    assert_response :unprocessable_content
  end

  test '#update' do
    student = students(:asmaa)

    put student_path(student), params: { student: { name: 'Mariam' } }

    assert_response :redirect
    assert_match 'Mariam', student.reload.name
  end

  test '#destroy' do
    student = students(:asmaa)

    delete student_path(student)

    assert_response :redirect
  end
end
