class Enemy < ActiveRecord::Base
  
  attr_accesible :enemy_template
  
  belongs_to :enemy_template
  belongs_to :region
  belongs_to :world, :through => :region
  
  after_create :create_items
  
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
