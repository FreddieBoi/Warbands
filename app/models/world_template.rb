# == Schema Information
# Schema version: 20110525164811
#
# Table name: world_templates
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class WorldTemplate < ActiveRecord::Base

  # All the worlds using this template
  has_many :worlds

  # All the regions in the world
  has_many :region_templates
  
  # Starting items for all the members
  has_many :item_templates

end
