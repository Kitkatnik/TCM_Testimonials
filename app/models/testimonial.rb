# == Schema Information
#
# Table name: testimonials
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Testimonial < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, class_name: "User"
end
