# app/mailers/notification_mailer.rb
class NotificationMailer < ApplicationMailer
  default from: ENV['ADMIN_EMAIL'] 

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My App')
  end
end
