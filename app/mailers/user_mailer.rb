class UserMailer < ActionMailer::Base
  default from: "welcome@heavymetal.herokuapp.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://heavymetal.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to Heavy Metal', host: 'heavymetal.herokuapp.com')
  end
end
