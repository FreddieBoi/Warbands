# == Schema Information
# Schema version: 20110430234753
#
# Table name: members
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  level      :integer         default(0), not null
#  experience :integer         default(0), not null
#  health     :integer         default(100), not null
#  max_health :integer         default(100), not null
#  warband_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base

  belongs_to :warband

  has_many :items

  validates :name, :presence => true, :length => { :within => 2..20 }
  # Search for Members matching the name of the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end
  
  def combat_value
    value = 0
    items.each do |item|
      value += item.combat_value
    end
    value
  end
end
