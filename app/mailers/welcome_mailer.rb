class WelcomeMailer < ApplicationMailer


  def welcome_mail(user)
    @user=user
    mail(to: @user.email, subject: "Welcome To My Webside!")
  end
end
