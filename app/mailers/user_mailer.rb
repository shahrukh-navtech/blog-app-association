class UserMailer < ApplicationMailer
	default from: "shah@sandbox94bbfc27dab4421f848047873d5c4416.mailgun.org  "

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_signup.subject
  #
  def new_signup(user, email)
    @greeting = "Hi"
    @user = user
    @email = email
    mail to: @email, subject: "Your Account has been created on blogApp"
  end
end
