require "test_helper"

class MailerControllerTest < ActionDispatch::IntegrationTest
  test "should get send_mail" do
    get mailer_send_mail_url
    assert_response :success
  end
end
