# == Schema Information
#
# Table name: web_links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  url        :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class WebLink < ActiveRecord::Base
  validates :url, presence: true, format: URI.regexp
  belongs_to :user
  SITES = ["Website", "Facebook", "Twitter", "Instagram", "LinkedIn", "Schedule"]
end
