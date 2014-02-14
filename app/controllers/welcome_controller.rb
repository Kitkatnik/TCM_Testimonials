class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @testimonial = Testimonial.new
    @users = User.all
  end
end
