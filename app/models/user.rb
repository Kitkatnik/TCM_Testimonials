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
#  first_name             :string(255)
#  last_name              :string(255)
#  bio                    :text
#  admin                  :boolean
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :testimonials
  has_many :received_testimonials, class_name: "Testimonial", foreign_key: "recipient_id"
  has_many :web_links
  has_many :feedbacks
  has_many :users_courses
  has_many :courses, through: :users_courses

  scope :all_not_me, ->(user) { where.not id: user.id }
  scope :of_courses, ->(course_ids) {
    joins(:courses).where("courses.id IN (?)", course_ids).uniq
  }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "120x120>" }, default_url: "http://placekitten.com/120/120"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  attr_accessor :course_code
  validate :add_course_from_code, on: :create

  def name 
    "#{first_name} #{last_name}"
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def get_web_link(site)
    web_links.where(title: site).first
  end

  private

  def add_course_from_code
    course = Course.find_by_code course_code
    errors.add :course, "Code is invalid" and return if course.nil?

    courses << course
  end
end

