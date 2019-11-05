class UserMailer < ApplicationMailer
  default from: 'alison.jardon@gmail.com'
  
  def welcome_email(user)
    @user = user
    @url = 'http://thisapp.dot/login'
    mail(to: @user.email, subject: 'Welcome here !')
  end
end
