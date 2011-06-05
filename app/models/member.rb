# == Schema Information
# Schema version: 20110603071110
#
# Table name: members
#
#  id           :integer         not null, primary key
#  name         :string(255)     not null
#  level        :integer         default(0), not null
#  experience   :integer         default(0), not null
#  health       :integer         default(100), not null
#  max_health   :integer         default(100), not null
#  combat_value :integer         default(0), not null
#  warband_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Member < ActiveRecord::Base

  belongs_to :warband

  has_many :items

  validates :name, :presence => true, :length => { :within => 2..20 }

  after_create :create_starting_items

  before_save :format_health, :update_xp
  # Search for Members matching the name of the specified search term
  def self.search(search)
    if search
      where("LOWER (name) LIKE ?", "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

  def calc_combat_value
    value = combat_value
    items.each do |item|
      value += item.combat_value
    end
    value
  end

  def equip_if_better?(item)
    items.each do |i|
      if item.combat_value > i.combat_value
      i.destroy
      item.member = self
      item.save!
      return true
      end
    end
    return false
  end

  private

  def create_starting_items
    t = warband.world.starting_items.sample
    i = Item.create(:item_template => t, :member => self)
  end

  def format_health
    if self.health < 0
    self.health = 0
    end
  end

  def update_xp
    while self.experience >= self.max_experience*self.level do
      self.level += 1
    end
  end

end
