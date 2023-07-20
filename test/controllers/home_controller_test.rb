require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "#home" do
    get home_index_url
    assert_response :success
  end
end
