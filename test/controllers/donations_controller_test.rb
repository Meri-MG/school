# frozen_string_literal: true

require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  test '#how_to_donate' do
    get how_to_donate_path
    assert_response :success
  end
end
