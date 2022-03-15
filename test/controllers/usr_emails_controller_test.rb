require "test_helper"

class UsrEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usr_email = usr_emails(:one)
  end

  test "should get index" do
    get usr_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_usr_email_url
    assert_response :success
  end

  test "should create usr_email" do
    assert_difference("UsrEmail.count") do
      post usr_emails_url, params: { usr_email: { email: @usr_email.email, name: @usr_email.name } }
    end

    assert_redirected_to usr_email_url(UsrEmail.last)
  end

  test "should show usr_email" do
    get usr_email_url(@usr_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_usr_email_url(@usr_email)
    assert_response :success
  end

  test "should update usr_email" do
    patch usr_email_url(@usr_email), params: { usr_email: { email: @usr_email.email, name: @usr_email.name } }
    assert_redirected_to usr_email_url(@usr_email)
  end

  test "should destroy usr_email" do
    assert_difference("UsrEmail.count", -1) do
      delete usr_email_url(@usr_email)
    end

    assert_redirected_to usr_emails_url
  end
end
