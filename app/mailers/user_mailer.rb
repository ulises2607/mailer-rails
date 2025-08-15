class UserMailer < ApplicationMailer
  def send_mail(to, subject, data)
    @subject = subject
    @data = data
    mail(to: to, subject: subject)
  end
end