class UserMailer < ApplicationMailer
  def welcome_email(email, user)
    @email = email
    @user = user
    @url = 'http://postcodesearch.com/login'

    mail(to: @email, subject: 'Welcome to PostcodeSearch')
  end
end
