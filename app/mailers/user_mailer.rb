class UserMailer < ActionMailer::Base
  default from: "jeromeallouche01@gmail.com"

    def welcome_email(user)
        @user = user
        @url  = 'http://localhost:3000/signin'
        mail(to: @user.email, subject: 'Welcome Welcome 2 Town')
    end

end
