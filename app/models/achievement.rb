# == Schema Information
# Schema version: 20110604123342
#
# Table name: achievements
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  reputation :integer
#  created_at :datetime
#  updated_at :datetime
#

class Achievement < ActiveRecord::Base
  has_many :warband_achievements
  has_many :warbands, :through => :warband_achievements
end
