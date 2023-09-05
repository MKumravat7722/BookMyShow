class UserMailer < ApplicationMailer
  default from: "mohitk@shriffle.com"
  layout 'mailer'
  def welcome_email
    @user=params[:user]
    mail(to: @user.email, subject: "Welcome To My Webside!")
  end     
end
