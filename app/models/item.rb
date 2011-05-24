class Item < ActiveRecord::Base

  attr_accessible :item_template

  # The template the item is an instance of
  belongs_to :item_template

  # An item could belong to a member, or ...
  belongs_to :member
  # ... or an enemy
  belongs_to :enemy
  def name
    :item_template.name
  end

  def cost
    :item_template.cost
  end

  def desc
    :item_template.desc
  end

  def combat_value
    :item_template.combat_value
  end

  def item_type
    :item_template.item_type
  end

end
