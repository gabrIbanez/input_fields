require "test_helper"

class InputFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input_field = input_fields(:one)
  end

  test "should get index" do
    get input_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_input_field_url
    assert_response :success
  end

  test "should create input_field" do
    assert_difference("InputField.count") do
      post input_fields_url, params: { input_field: { data: @input_field.data, form_id: @input_field.form_id, type: @input_field.type } }
    end

    assert_redirected_to input_field_url(InputField.last)
  end

  test "should show input_field" do
    get input_field_url(@input_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_input_field_url(@input_field)
    assert_response :success
  end

  test "should update input_field" do
    patch input_field_url(@input_field), params: { input_field: { data: @input_field.data, form_id: @input_field.form_id, type: @input_field.type } }
    assert_redirected_to input_field_url(@input_field)
  end

  test "should destroy input_field" do
    assert_difference("InputField.count", -1) do
      delete input_field_url(@input_field)
    end

    assert_redirected_to input_fields_url
  end
end
