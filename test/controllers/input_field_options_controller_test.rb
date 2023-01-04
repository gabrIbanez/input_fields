require "test_helper"

class InputFieldOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input_field_option = input_field_options(:one)
  end

  test "should get index" do
    get input_field_options_url
    assert_response :success
  end

  test "should get new" do
    get new_input_field_option_url
    assert_response :success
  end

  test "should create input_field_option" do
    assert_difference("InputFieldOption.count") do
      post input_field_options_url, params: { input_field_option: { data: @input_field_option.data, input_field_id: @input_field_option.input_field_id, name: @input_field_option.name, position: @input_field_option.position } }
    end

    assert_redirected_to input_field_option_url(InputFieldOption.last)
  end

  test "should show input_field_option" do
    get input_field_option_url(@input_field_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_input_field_option_url(@input_field_option)
    assert_response :success
  end

  test "should update input_field_option" do
    patch input_field_option_url(@input_field_option), params: { input_field_option: { data: @input_field_option.data, input_field_id: @input_field_option.input_field_id, name: @input_field_option.name, position: @input_field_option.position } }
    assert_redirected_to input_field_option_url(@input_field_option)
  end

  test "should destroy input_field_option" do
    assert_difference("InputFieldOption.count", -1) do
      delete input_field_option_url(@input_field_option)
    end

    assert_redirected_to input_field_options_url
  end
end
