require "application_system_test_case"

class InputFieldsTest < ApplicationSystemTestCase
  setup do
    @input_field = input_fields(:one)
  end

  test "visiting the index" do
    visit input_fields_url
    assert_selector "h1", text: "Input fields"
  end

  test "should create input field" do
    visit input_fields_url
    click_on "New input field"

    fill_in "Data", with: @input_field.data
    fill_in "Form", with: @input_field.form_id
    fill_in "Type", with: @input_field.type
    click_on "Create Input field"

    assert_text "Input field was successfully created"
    click_on "Back"
  end

  test "should update Input field" do
    visit input_field_url(@input_field)
    click_on "Edit this input field", match: :first

    fill_in "Data", with: @input_field.data
    fill_in "Form", with: @input_field.form_id
    fill_in "Type", with: @input_field.type
    click_on "Update Input field"

    assert_text "Input field was successfully updated"
    click_on "Back"
  end

  test "should destroy Input field" do
    visit input_field_url(@input_field)
    click_on "Destroy this input field", match: :first

    assert_text "Input field was successfully destroyed"
  end
end
