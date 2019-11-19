require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_signup" do
    mail = UserMailer.new_signup
    assert_equal "New signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
