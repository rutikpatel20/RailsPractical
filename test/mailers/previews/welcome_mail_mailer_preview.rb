# Preview all emails at http://localhost:3000/rails/mailers/welcome_mail_mailer
class WelcomeMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mail_mailer/create_mail
  def create_mail
    WelcomeMailMailer.create_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mail_mailer/update_mail
  def update_mail
    WelcomeMailMailer.update_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mail_mailer/delete_mail
  def delete_mail
    WelcomeMailMailer.delete_mail
  end

end
