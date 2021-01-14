# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    email = 'sarthak.arora@simplificator.com'
    user = User.create(username: "mmmm", email: "abcdef@gmail.com", provider: nil, uid: nil, token: nil, password: nil)
    UserMailer.welcome_email(email, user)
  end
end
