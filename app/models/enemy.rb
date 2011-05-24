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

  has_many :items

  after_create :create_items
  def world
    region.world
  end

  def template
    enemy_template
  end

  def name
    template.name
  end

  def max_health
    template.max_health
  end

  def desc
    template.desc
  end

  def combat_value
    value = template.combat_value
    items.each do |i|
      value += i.combat_value
    end
    value
  end

  private

  def create_items
    template.item_templates.each do |t|
      item = Item.create!(:item_template => t, :enemy => self)
    end
  end

end
