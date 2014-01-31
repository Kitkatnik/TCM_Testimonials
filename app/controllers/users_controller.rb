class UsersController < ApplicationController
  def show
    @name = "Katya Sarmiento"
    @testimonial = Testimonial.new
    @author = "TCM Student"
  end
end
