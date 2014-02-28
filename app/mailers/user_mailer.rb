class UserMailer < ActionMailer::Base
  default from: "katwebd@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to the TCM Testimonials Site')
  end

  def notification(recipient)
    @user = recipient
    mail(to: @user.email, subject: "New Testimonial from #{@user.name}!")
  end

end
