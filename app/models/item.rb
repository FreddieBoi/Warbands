# == Schema Information
# Schema version: 20110430234753
#
# Table name: items
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  desc       :text
#  cost       :integer         default(0), not null
#  item_type  :string(255)
#  member_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base

  belongs_to :member

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

end
