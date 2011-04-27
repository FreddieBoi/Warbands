# == Schema Information
# Schema version: 20110419143038
#
# Table name: warbands
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  reputation :integer
#  pos_x      :integer
#  pos_y      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Warband < ActiveRecord::Base
  
  def update_pos(x, y)
    self.pos_x = x
    self.pos_y = y
    save!
  end
  
end
