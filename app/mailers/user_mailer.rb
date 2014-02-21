class UserMailer < ActionMailer::Base
  default from: "katwebd@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to the TCM Testimonials Site')
  end
end
