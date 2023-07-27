require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest

  test "#show" do
    about_school = abouts(:about_school)
    get about_path(about_school)

    assert_response :success
  end

  test "#edit" do
    about_school = abouts(:about_school)
    get edit_about_path(about_school)

    assert_response :success
  end

  test "#update" do
    about_school = abouts(:about_school)
    patch about_path(about_school), params: { about: { title: 'Center' } }

    assert_redirected_to about_path(about_school)
    assert_equal 'Center', about_school.reload.title
  end

  test "#update fails" do
    about_school = abouts(:about_school)

    assert_raises ActiveRecord::RecordInvalid do
      patch about_path(about_school), params: { about: { title: '' } }
    end
  end
end
