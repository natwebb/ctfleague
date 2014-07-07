class UserMailer < ActionMailer::Base
  default from: "welcome@heavymetalalpha.herokuapp.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://heavymetalalpha.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Heavy Metal', host: 'heavymetalalpha.herokuapp.com')
  end
end
