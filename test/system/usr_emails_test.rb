require "application_system_test_case"

class UsrEmailsTest < ApplicationSystemTestCase
  setup do
    @usr_email = usr_emails(:one)
  end

  test "visiting the index" do
    visit usr_emails_url
    assert_selector "h1", text: "Usr emails"
  end

  test "should create usr email" do
    visit usr_emails_url
    click_on "New usr email"

    fill_in "Email", with: @usr_email.email
    fill_in "Name", with: @usr_email.name
    click_on "Create Usr email"

    assert_text "Usr email was successfully created"
    click_on "Back"
  end

  test "should update Usr email" do
    visit usr_email_url(@usr_email)
    click_on "Edit this usr email", match: :first

    fill_in "Email", with: @usr_email.email
    fill_in "Name", with: @usr_email.name
    click_on "Update Usr email"

    assert_text "Usr email was successfully updated"
    click_on "Back"
  end

  test "should destroy Usr email" do
    visit usr_email_url(@usr_email)
    click_on "Destroy this usr email", match: :first

    assert_text "Usr email was successfully destroyed"
  end
end
