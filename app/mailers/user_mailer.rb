class UserMailer < ApplicationMailer
    default from: 'hello@kickabyte.com'
 
    def welcome_email(user)
        @user = user
        @url  = 'https://www.kickabyte.com'
    mail(to: @user.email, subject: 'You have received a response to your question')
  end
end
