require "test_helper"

class FormPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get form_pages_create_url
    assert_response :success
  end
end
