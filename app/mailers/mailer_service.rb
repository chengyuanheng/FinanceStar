class MailerService < ActionMailer::Base
  default from: "geteshiye@gmail.com"

  def welcome_email user
    @user = user
    @url = "http://localhost:3000"
    mail(to: @user.email, subject: "Welcome To My Awesome Site")
  end

end
