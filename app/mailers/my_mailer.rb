class MyMailer < ActionMailer::Base
  default from: "colegu123@gmail.com"
  def welcome_email(user)
    @user = user
    @url  = "http://teamx.iuliad.imcserver.ro/statistics/"
    mail(:to => user, :subject => "Welcome to Reffy")
  end
end
