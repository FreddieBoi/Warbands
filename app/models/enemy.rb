# == Schema Information
# Schema version: 20110511090306
#
# Table name: enemies
#
#  id                :integer         not null, primary key
#  health            :integer         default(100), not null
#  enemy_template_id :integer         not null
#  region_id         :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Enemy < ActiveRecord::Base
  
  attr_accessible :enemy_template
  
  belongs_to :enemy_template
  belongs_to :region
  
  after_create :create_items
  
  def world
    :region.world
  end
  
  def name
    :enemy_template.name
  end
  
  def max_health
    :enemy_template.max_health
  end
  
  def desc
    :enemy_template.desc
  end
  
  private
  
  def create_items
    # :enemy_template.item_templates.each do |template|
      # item.create!(template)
      # item.enemy = self
    # end
  end

end
