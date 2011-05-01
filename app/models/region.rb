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
  
  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  
end
