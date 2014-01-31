class WelcomeController < ApplicationController
  def index
    @testimonial = Testimonial.new
  end
end
