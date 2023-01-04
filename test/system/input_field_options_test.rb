require "application_system_test_case"

class InputFieldOptionsTest < ApplicationSystemTestCase
  setup do
    @input_field_option = input_field_options(:one)
  end

  test "visiting the index" do
    visit input_field_options_url
    assert_selector "h1", text: "Input field options"
  end

  test "should create input field option" do
    visit input_field_options_url
    click_on "New input field option"

    fill_in "Data", with: @input_field_option.data
    fill_in "Input field", with: @input_field_option.input_field_id
    fill_in "Name", with: @input_field_option.name
    fill_in "Position", with: @input_field_option.position
    click_on "Create Input field option"

    assert_text "Input field option was successfully created"
    click_on "Back"
  end

  test "should update Input field option" do
    visit input_field_option_url(@input_field_option)
    click_on "Edit this input field option", match: :first

    fill_in "Data", with: @input_field_option.data
    fill_in "Input field", with: @input_field_option.input_field_id
    fill_in "Name", with: @input_field_option.name
    fill_in "Position", with: @input_field_option.position
    click_on "Update Input field option"

    assert_text "Input field option was successfully updated"
    click_on "Back"
  end

  test "should destroy Input field option" do
    visit input_field_option_url(@input_field_option)
    click_on "Destroy this input field option", match: :first

    assert_text "Input field option was successfully destroyed"
  end
end
