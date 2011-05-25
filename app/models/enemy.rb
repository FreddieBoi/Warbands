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

  attr_accessible :enemy_template, :region

  # The template the enemy is an instance of
  belongs_to :enemy_template

  # The region this enemy is in
  belongs_to :region

  # All the equipped items
  has_many :items

  # Create all the items to equip upon creation
  after_create :create_items
  # Get the world this enemy is in
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
