# == Schema Information
# Schema version: 20110419143038
#
# Table name: items
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  cost        :integer
#  item_type   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  member_id   :integer
#

class Item < ActiveRecord::Base
	
	belongs_to :member
	
end
