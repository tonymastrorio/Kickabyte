class UserMailer < ApplicationMailer
    default from: 'tony.mastrorio@gmail.com'
 
    def welcome_email(user)
        @user = user
        @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'You have received a response to your question')
  end
end
