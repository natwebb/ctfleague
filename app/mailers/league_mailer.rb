class LeagueMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_email(league)
    @user = league
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to CTFLeague', host: 'example.com')
  end
end
