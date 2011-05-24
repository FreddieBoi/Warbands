# == Schema Information
# Schema version: 20110524170448
#
# Table name: items
#
#  id               :integer         not null, primary key
#  item_template_id :integer         not null
#  enemy_id         :integer
#  member_id        :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Item < ActiveRecord::Base

  attr_accessible :item_template, :member, :enemy

  # The template the item is an instance of
  belongs_to :item_template

  # An item could belong to a member, or ...
  belongs_to :member
  # ... or an enemy
  belongs_to :enemy
  def template
    item_template
  end

  def name
    template.name
  end

  def cost
    template.cost
  end

  def desc
    template.desc
  end

  def combat_value
    template.combat_value
  end

  def item_type
    template.item_type
  end

end
