class DraftMailer < ActionMailer::Base
  default from: "from@example.com"

  def draft_beginning_email(league, snake_position, draft)
    @snake_position = snake_position
    @member = snake_position.user
    @league = league
    @draft = draft

    mail(to: @member.email, subject: 'The draft has begun!', host: 'example.com')
  end
end
