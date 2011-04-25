# == Schema Information
# Schema version: 20110419143038
#
# Table name: members
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  level      :integer
#  experience :integer
#  health     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base
	has_many :items
end
