# == Schema Information
# Schema version: 20110430234753
#
# Table name: regions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  pos_x      :integer
#  pos_y      :integer
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#

class Region < ActiveRecord::Base
  
  has_many :warbands
  
  def to_javascript_json
    to_json.gsub("\"", "'")
  end
  
end
