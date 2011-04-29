# == Schema Information
# Schema version: 20110427205619
#
# Table name: warbands
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  reputation :integer
#  pos_x      :integer
#  pos_y      :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Warband < ActiveRecord::Base
  
  belongs_to :user
  
  belongs_to :region
  
end
