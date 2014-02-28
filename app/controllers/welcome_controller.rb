class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @testimonial  = Testimonial.new
    base_query    = User.all_not_me(current_user).of_courses current_user.course_ids
    @alphabetical = base_query.alphabetical
    @newest       = base_query.newest
    @top          = User.top base_query
    @recommended  = User.recommended current_user.id, base_query
  end
end
