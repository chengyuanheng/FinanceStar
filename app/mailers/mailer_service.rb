class MailerService < ActionMailer::Base
  default from: "geteshiye@gmail.com"

  def welcome_email user , verify_code
    @verify_code = verify_code
    @user = user
    @url = "http://localhost:3000"
    mail(to: @user.email, subject: "Welcome To My Awesome Site")
  end

end