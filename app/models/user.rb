# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :testimonials
  has_many :received_testimonials, class_name: "Testimonial", foreign_key: "recipient_id"
  has_many :web_links
  scope :all_not_me, where("email != ?", "kittyserenakat@gmail.com")

  def name 
    "#{first_name} #{last_name}"
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def get_web_link(site)
    web_links.where(title: site).first
  end

end

