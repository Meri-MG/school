require "test_helper"

class SponsoredStudentsControllerTest < ActionDispatch::IntegrationTest
  test "#index" do
    get sponsored_students_path

    assert_response :success
  end
end