class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@thisapp.dot'
  
  def new_guest_email(user)
    @user = user
    @url = 'http://thisapp.dot/login'
    mail(to: @user.email, subject: 'You have a new guest !')
  end
end
