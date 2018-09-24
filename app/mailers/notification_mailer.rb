class NotificationMailer < ApplicationMailer
  default from: "heqifatiha9@gmail.com"

  def send_email(user)
    @user = user
    mail(:to => user.email,
         :subject => "Thank you for your order")
  end
end
