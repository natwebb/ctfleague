require "spec_helper"
require_relative "../../app/mailers/user_mailer"

describe "Welcome email" do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  before do
    @user = Fabricate(:user)
    @mail = UserMailer.welcome_email(@user)
  end

  it "should be from from@example.com" do
    @mail.should deliver_from("from@example.com")
  end
  it "should be sent to the user's email address" do
    @mail.should deliver_to(@user.email)
  end
  it "should have a subject line of 'Welcome to CTFLeague'" do
    @mail.should have_subject("Welcome to CTFLeague")
  end
  it "should actually welcome the user to CTFLeague" do
    @mail.should have_body_text("Welcome to CTFLeague, #{@user.username}!")
  end
  it "should have a link to the site in it" do
    @mail.should have_body_text("To log in to the site, just follow this link: http://example.com/login.")
  end
  it "shouldn't have this text in it" do
    @mail.should_not have_body_text("I'm a little teapot, short and stout")
  end
end
