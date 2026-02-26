# frozen_string_literal: true

require 'test_helper'

class StudentsControllerSponsoredTest < ActionDispatch::IntegrationTest
  test '#index' do
    get sponsored_students_path

    assert_response :success
  end
end
